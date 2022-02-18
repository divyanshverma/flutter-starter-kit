import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';
import 'drawer.dart';

/// This is the stateless widget that the main application instantiates.
class AttendanceWidget extends StatelessWidget {
  const AttendanceWidget({Key? key}) : super(key: key);

  static const mainProfilePicture =
      "https://randomuser.me/api/portraits/women/44.jpg";
  static const otherProfilePicture =
      "https://randomuser.me/api/portraits/women/47.jpg";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Attendance'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text("Pending") //Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Text("Completed")//Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Text("Holidays")//Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        drawer: Container(
            width: 350,
            child: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: new OBDrawer().load(context),
              ),
            )),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text('It\'s Take attendance here'),
            ),
            Center(
              child: Text('It\'s Completed here'),
            ),
            Center(
              child: Text('It\'s Pending here'),
            ),
          ],
        ),
      ),
    );
  }
}
