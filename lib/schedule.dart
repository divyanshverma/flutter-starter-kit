import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';
import 'drawer.dart';

/// This is the stateless widget that the main application instantiates.
class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  static const mainProfilePicture =
      "https://randomuser.me/api/portraits/women/44.jpg";
  static const otherProfilePicture =
      "https://randomuser.me/api/portraits/women/47.jpg";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Schedule'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(icon: Text("Monday") //Icon(Icons.cloud_outlined),
              ),
              Tab(icon: Text("Tuesday") //Icon(Icons.beach_access_sharp),
              ),
              Tab(icon: Text("Wednesday") //Icon(Icons.brightness_5_sharp),
              ),
              Tab(icon: Text("Thursday") //Icon(Icons.brightness_5_sharp),
              ),
              Tab(icon: Text("Friday") //Icon(Icons.brightness_5_sharp),
              ),
              Tab(icon: Text("Saturday") //Icon(Icons.brightness_5_sharp),
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
        body: TabBarView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 220,
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 220,
                                  child: Card(
                                    elevation: 5,
                                    child: Text("Hello"),
                                  ));
                            })),
                  ],
                )
              //

            ),
            Center(
              child: Text('It\'s Completed here'),
            ),
            Center(
              child: Text('It\'s Pending here'),
            ),
            Center(
              child: Text('It\'s Pending here'),
            ),
            Center(
              child: Text('It\'s Pending here'),
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
