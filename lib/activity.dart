import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_app/viewalbum.dart';

import 'auth.dart';
import 'drawer.dart';

/// This is the stateless widget that the main application instantiates.
class ActivityWidget extends StatelessWidget {
  const ActivityWidget({Key? key}) : super(key: key);

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
          title: const Text('Activities'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Text("Notice Board") //Icon(Icons.cloud_outlined),
              ),
              Tab(icon: Text("Toppers") //Icon(Icons.beach_access_sharp),
              ),
              Tab(icon: Text("Birthday's") //Icon(Icons.brightness_5_sharp),
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
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 220,
                                  child: GestureDetector(
                                      onTap: () =>
                                      {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewAlbum()),
                                        )
                                      },
                                      child: Flexible( child: buildCard())
                                  )
                              );
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
          ],
        ),
      ),
    );
  }

  Card buildCard() {
    var ran = Random();
    var heading = '\$${(ran.nextInt(20) + 15).toString()}00 per month';
    var subheading =
        '${(ran.nextInt(3) + 1).toString()} bed, ${(ran.nextInt(2) + 1)
        .toString()} bath, ${(ran.nextInt(10) + 7).toString()}00 sqft';
    var cardImage = NetworkImage(
        'https://source.unsplash.com/random/800x600?house&' +
            ran.nextInt(100).toString());
    var supportingText =
        'Beautiful home to rent, recently refurbished with modern appliances...';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
              trailing: Icon(Icons.favorite_outline),
            ),
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('CONTACT AGENT'),
                  onPressed: () {
                    /* ... */
                  },
                ),
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: () {
                    /* ... */
                  },
                )
              ],
            )
          ],
        ));
  }
}