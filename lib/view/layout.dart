import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../res/widget/circlechart_widget.dart';
import '../res/widget/drawer_widget.dart';
import 'dashboard.dart';
import 'home_screen.dart';

class Layout extends StatefulWidget {
  final dynamic selectedIndex;
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
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const DashboardPage(),
    const ExportCircle(),
    const Text('Profile'),
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
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          child: const Text(
                            "Yes",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("No",
                            style: TextStyle(color: Colors.black)),
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
          title: const Text('Wepora MVVM'),
          actions: [
            IconButton(
              onPressed: (() {
                if (kDebugMode) {
                  print('folder clicked');
                }
              }),
              icon: const Icon(Icons.share),
              color: const Color.fromARGB(255, 255, 255, 255),
              iconSize: 20,
            ),
          ],
        ),
        drawer: const DrawerWidget(),
        body: Center(
          child: _widgetOptions.elementAt(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                FontAwesomeIcons.house,
                size: 20,
              ),
              label: 'Home',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.leaf),
              label: 'Co2 Footprint',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                FontAwesomeIcons.solidBell,
                size: 24,
              ),
              label: 'Notification',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
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
