import 'package:flutter/material.dart';
import 'package:data_dog_app/util/themes.dart';
import 'package:data_dog_app/util/widgets.dart';

class CpuPage extends StatelessWidget {
  final Color color;

  CpuPage(this.color);

  final ChartWidget myFirstChart = new ChartWidget(title: "Cpu Usage");
  final ChartWidget mySecondChart = new ChartWidget(title: "Cpu Temperature");
  final ChartWidget myThirdChart = new ChartWidget(title: "Cpu Core Speed");

  @override
  Widget build(BuildContext context) {
    final TextStyle chartTitleStyle = TextStyle(color: color);

    return Stack(
      children: <Widget>[
        new Container(
          child: Positioned(
            bottom: 15,
            left: MediaQuery.of(context).size.width / 2 - 45,
            child: Image.asset(
              "assets/rakun_icon.png",
              height: 90,
              fit: BoxFit.contain,
            ),
          ),
        ),
        new Container(
          height: double.infinity,
          width: double.infinity,
          color: color,
        ),
        new DefaultTabController(
          length: 3,
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
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
                  Tab(icon: Icon(Icons.title), text: "Temperature"),
                  Tab(icon: Icon(Icons.shutter_speed), text: "Speed"),
                ],
              ),
              backgroundColor: HexColor('#212121'),
              centerTitle: true,
              title: new Text(
                "Cpu Screen",
                textAlign: TextAlign.center,
                style: chartTitleStyle,
              ),
              actions: <Widget>[
                IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/home'));
                  },
                ),
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
                              child:
                                  new Text("Cpu Usage", style: chartTitleStyle),
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
                              child: new Text("Cpu Temperature",
                                  style: chartTitleStyle),
                            ),
                            height: 25,
                            width: 110,
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
                              child:
                                  new Text("Cpu Speed", style: chartTitleStyle),
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
