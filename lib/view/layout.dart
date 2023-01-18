import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wepora/utils/color.dart';
import '../res/widget/circlechart_widget.dart';
import '../res/widget/drawer_widget.dart';
import 'dashboard.dart';
import 'home_screen.dart';

class Layout extends StatefulWidget {
  final selectedIndex;
  const Layout({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 0;
  @override
  void initState() {
    _currentIndex = widget.selectedIndex;
  }

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DashboardPage(),
    ExportCircle(),
    Text('Profile'),
  ];

  //Exit box
  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Do you want to exit?"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: const Text(
                            "Yes",
                            textAlign: TextAlign.center,
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("No",
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Wepora MVVM'),
          actions: [
            IconButton(
              onPressed: (() {
                print('folder clicked');
              }),
              icon: Icon(Icons.share),
              color: Color.fromARGB(255, 255, 255, 255),
              iconSize: 20,
            ),
          ],
        ),
        drawer: DrawerWidget(),
        body: Center(
          child: _widgetOptions.elementAt(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                size: 20,
              ),
              label: 'Home',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.leaf),
              label: 'Co2 Footprint',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidBell,
                size: 24,
              ),
              label: 'Notification',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.gear,
                size: 22,
              ),
              label: 'Co2 Footprint',
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Theme.of(context).primaryColorLight,
          unselectedItemColor: Theme.of(context).iconTheme.color,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
