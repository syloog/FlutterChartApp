import 'package:data_dog_app/util/animation.dart';
import 'package:data_dog_app/util/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  DrawerItem(this.title);
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // Set the transparency here
        canvasColor: HexColor(
            "##e3c800"), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  child: Image.asset(
                    "assets/datarakun_icon.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Container(
              color: HexColor("#e3c800"),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: HexColor('#212121'),
                    ),
                    child: ListTile(
                      title: Text('Cpu Screen',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: HexColor('#e3c800'))),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/cpu');
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: HexColor('#212121'),
                    ),
                    child: ListTile(
                      title: Text('Gpu Screen',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: HexColor('#e3c800'))),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/gpu');
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: HexColor('#212121'),
                    ),
                    child: ListTile(
                      title: Text('HDD Screen',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: HexColor('#e3c800'))),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/hdd');
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: HexColor('#212121'),
                    ),
                    child: ListTile(
                      title: Text('Net Screen',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: HexColor('#e3c800'))),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/net');
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
