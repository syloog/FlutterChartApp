import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:data_dog_app/util/themes.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart';

class DataUsage {
  final String chartName;
  double usage;
  int increment;
  final double width = 2;
  DataUsage(this.chartName, this.usage, this.increment);
}

class CurrentData {
  double usedRam;
  double totalRam;
  double availableRam;
  double freeRam;
  int cpuCoreCount;
  int percent;
  int totalHdd;
  int freeHdd;
  int usedHdd;

  CurrentData(
      {this.usedRam,
      this.totalRam,
      this.availableRam,
      this.freeRam,
      this.cpuCoreCount,
      this.freeHdd,
      this.percent,
      this.totalHdd,
      this.usedHdd});

  factory CurrentData.fromJson(Map<String, dynamic> parsedJson) {
    return CurrentData(
      usedRam: parsedJson['used_ram'] as double,
      totalRam: parsedJson['total_ram'],
      availableRam: parsedJson['available_ram'] as double,
      freeRam: parsedJson['free_ram'],
      cpuCoreCount: parsedJson['cpu_core_count'] as int,
      percent: parsedJson['percent'] as int,
      totalHdd: parsedJson['total_hdd'] as int,
      usedHdd: parsedJson['used_hdd'] as int,
      freeHdd: parsedJson['free_hdd'] as int,
    );
  }
}

class ChartWidget extends StatefulWidget {
  ChartWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ChartWidgetState createState() => new ChartWidgetState(title);
}

class ChartWidgetState extends State<ChartWidget> {
  final String title;
  var limit;
  List<charts.Series<DataUsage, int>> _seriesLineData;
  List<DataUsage> dataUsageList;
  var isLoading = false;
  String serverResponse = 'Server response';
  Timer timer;
  bool timerStatus;

  _makeGetRequest() async {
    try {
      final Response response = await get(_localhost());
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        var list = parsed
            .map<CurrentData>((json) => CurrentData.fromJson(json))
            .toList();
        if (dataUsageList.length > 30) dataUsageList.removeAt(0);
        dataUsageList
            .add(new DataUsage(title, (list[0].usedRam), dataUsageList.length));

        print("————————————————————————");
        print("Used Ram: " + (list[0].usedRam).toString());
        print("Available Ram: " + (list[0].availableRam).toString());
        print("Free Ram: " + (list[0].freeRam).toString());
        print("Total Ram: " + (list[0].totalRam).toString());
        print("Cpu Core Count: " + (list[0].cpuCoreCount).toString());
        print("Percentage: " + (list[0].percent).toString());
        print("Total HDD: " + (list[0].totalHdd).toString());
        print("Free HDD: " + (list[0].freeHdd).toString());
        print("Used HDD: " + (list[0].usedHdd).toString());
        print("Time: " + (timer.tick).toString());
        print("Data Length: " + (dataUsageList.length).toString());
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = true;
      });
      print(e);
    }
  }

  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:3000/get';
    else // for iOS simulator
      return 'localhost:3000/get';
  }

  ChartWidgetState(this.title);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dataUsageList = null;
    _seriesLineData = null;
    timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    dataUsageList = new List<DataUsage>();
    _seriesLineData = List<charts.Series<DataUsage, int>>();

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(HexColor('#011a27')),
        id: 'Series',
        data: dataUsageList,
        measureFn: (DataUsage usages, _) => usages.usage,
        strokeWidthPxFn: (DataUsage usages, _) => usages.width,
        domainFn: (DataUsage usages, _) => usages.increment,
      ),
    );

    timerStatus = true;
    timer = new Timer.periodic(
        Duration(milliseconds: 3000), (Timer t) => _makeGetRequest());
  }

  @override
  void setState(fn) {
    if (mounted)
// TODO: implement setState
      super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : charts.LineChart(
              _seriesLineData,
              // Set the initial viewport by providing a new AxisSpec with the
              // desired viewport, in NumericExtents.
              // Optionally add a pan or pan and zoom behavior.
              // If pan/zoom is not added, the viewport specified remains the viewport.
              domainAxis: new charts.NumericAxisSpec(
                tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                    zeroBound: false,
                    desiredTickCount: 15,
                    desiredMinTickCount: 15,
                    desiredMaxTickCount: 15),
                renderSpec: new charts.SmallTickRendererSpec(
                  lineStyle: new charts.LineStyleSpec(
                      color: charts.ColorUtil.fromDartColor(HexColor("212121")),
                      thickness: 2),
                  minimumPaddingBetweenLabelsPx: 0,
                ),
              ),
              primaryMeasureAxis: new charts.NumericAxisSpec(
                renderSpec: new charts.SmallTickRendererSpec(
                  lineStyle: new charts.LineStyleSpec(
                      color: charts.ColorUtil.fromDartColor(HexColor("212121")),
                      thickness: 2),
                  minimumPaddingBetweenLabelsPx: 0,
                ),
              ),
              animate: false,
            ),
    );
  }
}
