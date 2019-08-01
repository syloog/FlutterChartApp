import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:data_dog_app/util/themes.dart';
import 'drawer.dart';

class MainScreenPage extends StatefulWidget {
  MainScreenPage({Key key}) : super(key: key);
  @override
  _MainScreenPageState createState() => new _MainScreenPageState();
}

class DrawerItem {
  String title;
  DrawerItem(this.title);
}

class _MainScreenPageState extends State<MainScreenPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            color: HexColor("#FFFC00"),
          ),
        ),
        Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(
                color: HexColor("#FFFC00"), //change your color here
            ),
            backgroundColor: HexColor('#212121'),
            centerTitle: true,
            title: new Text(
              "Data Dog",
              textAlign: TextAlign.center,
              style: TextStyle(color: HexColor("#FFFC00")),
            ),
            actions: <Widget>[
              IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              )
            ],
          ),
          drawer: MyDrawer(),
          body: Container(
            margin: const EdgeInsets.all(20.0),
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.all(50),
            child: Image.asset(
              "assets/rakun_icon.png",
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
