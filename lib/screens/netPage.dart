
import 'package:flutter/material.dart';
import 'package:data_dog_app/util/themes.dart';
import 'package:data_dog_app/util/widgets.dart';

class NetPage extends StatelessWidget {

  final Color color;

  NetPage(this.color);

  final ChartWidget myFirstChart = new ChartWidget(title: "Net Usage");
  final ChartWidget mySecondChart = new ChartWidget(title: "Net Download");
  final ChartWidget myThirdChart = new ChartWidget(title: "Net Upload");

  @override
  Widget build(BuildContext context) {

    final TextStyle chartTitleStyle = TextStyle(color: color);

    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          color: color,
        ),
        new DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: color, //change your color here
              ),
              leading: Container(),
              bottom: TabBar(
                labelColor: color,
                unselectedLabelColor: HexColor('#ffffff'),
                indicatorColor: color,
                tabs: [
                  Tab(icon: Icon(Icons.blur_on), text: "Usage"),
                  Tab(icon: Icon(Icons.file_download), text: "Download"),
                  Tab(icon: Icon(Icons.file_upload), text: "Upload"),
                ],
              ),
              backgroundColor: HexColor('#212121'),
              centerTitle: true,
              title: new Text(
                "Net Screen",
                textAlign: TextAlign.center,
                style: chartTitleStyle,
              ),
              actions: <Widget>[
                BackButton(color: color),
              ],
            ),
            body: TabBarView(
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: color,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            child: new Center(
                              child: new Text("Net Usage", style: chartTitleStyle),
                            ),
                            height: 25,
                            width: 75,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: HexColor("212121"),
                            ),
                          ),
                          new Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: myFirstChart,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: color,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            child: new Center(
                              child: new Text("Net Download", style: chartTitleStyle),
                            ),
                            height: 25,
                            width: 100,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: HexColor("212121"),
                            ),
                          ),
                          new Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: myFirstChart,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: color,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            child: new Center(
                              child: new Text("Net Upload", style: chartTitleStyle),
                            ),
                            height: 25,
                            width: 80,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: HexColor("212121"),
                            ),
                          ),
                          new Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: myFirstChart,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: MediaQuery.of(context).size.width / 2 - 45,
          child: Image.asset(
            "assets/rakun_icon.png",
            height: 90,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
