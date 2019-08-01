import 'package:flutter/material.dart';
import 'package:data_dog_app/util/themes.dart';

class WaitingPage extends StatefulWidget {
  @override
  _WaitingPageState createState() => new _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat', fontSize: 15.0, color: HexColor('#F0810F'));

  @override
  void initState() {
    super.initState();
  }

  void navigate() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final skipButton = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10.0),
      color: HexColor('#3498db'),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.25,
        onPressed: () {
          navigate();
        },
        child: Text("Skip",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: HexColor("#FFFC00"), fontWeight: FontWeight.bold)),
      ),
    );

    final skipButton2 = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10.0),
      color: HexColor('#FF2F94'),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.25,
        onPressed: () {
          navigate();
        },
        child: Text("Skip",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: HexColor("#ffffff"), fontWeight: FontWeight.bold)),
      ),
    );

    final skipButton3 = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10.0),
      color: HexColor('#FFFC00'),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.25,
        onPressed: () {
          navigate();
        },
        child: Text("Skip",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: HexColor("#d80073"), fontWeight: FontWeight.bold)),
      ),
    );

    return Stack(
      children: <Widget>[
        new Scaffold(
          resizeToAvoidBottomPadding: false,
          body: new PageView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                color: HexColor("#FFFC00"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text(
                                "The charts are being plotted in real-time, you can watch it anytime",
                                style: TextStyle(
                                    color: HexColor("#FFFC00"), fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  "assets/time_animated.gif",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: HexColor('#3498db'),
                        ),
                        height: (MediaQuery.of(context).size.height / 8) * 6,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: skipButton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: HexColor("#3498db"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text(
                                "With just one swipe, you change your view",
                                style: TextStyle(
                                    color: HexColor("#ffffff"), fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(35.0),
                                child: new ClipRRect(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  child: Image.asset(
                                    "assets/swipe_icon.gif",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: HexColor('#FF2F94'),
                        ),
                        height: (MediaQuery.of(context).size.height / 8) * 6,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: skipButton2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: HexColor("#d80073"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text(
                                "You can watch your computer's performance easily",
                                style: TextStyle(
                                    color: HexColor("#d80073"), fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  padding: const EdgeInsets.all(35.0),
                                  child: new ClipRRect(
                                    borderRadius: new BorderRadius.circular(18.0),
                                    child: Image.asset(
                                    "assets/chart_example.gif",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: HexColor('#FFFC00'),
                        ),
                        height: (MediaQuery.of(context).size.height / 8) * 6,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: skipButton3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
