import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

class OBDrawer {
  static const mainProfilePicture =
      "https://randomuser.me/api/portraits/women/44.jpg";
  static const otherProfilePicture =
      "https://randomuser.me/api/portraits/women/47.jpg";

  load(context) {
    return <Widget>[
      new UserAccountsDrawerHeader(
          accountName: Text.rich(
            TextSpan(
              text: 'Divyansh', // default text style
              children: <TextSpan>[
                // TextSpan(text: ' | ', style: TextStyle(fontStyle: FontStyle.italic)),
                TextSpan(text: ' | Logout', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          accountEmail: Text("ashishrawat2911@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                ? Colors.blue
                : Colors.white,
            child: Text(
              "A",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          // otherAccountsPictures: <Widget>[
          //   Center(
          //     child: Text('Logout'),
          //   ),
          //   Center(
          //     child: Text('Profile'),
          //   ),
          // ],
          // decoration: new BoxDecoration(
          //     image: new DecorationImage(
          //         fit: BoxFit.fill,
          //         image: new NetworkImage(
          //             "https://orig00.deviantart.net/20eb/f/2015/030/6/f/_minflat__dark_material_design_wallpaper__4k__by_dakoder-d8fjqzu.jpg")
          //     )
          // )
      ),
      ListTile(
        title: Text('Home'),
        onTap: () async {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
          await Provider.of<AuthService>(context, listen: false).logout();
        },
      ),
      ListTile(
        title: Text('My Group'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('Leave Request'),
        onTap: () {
          // Update the state of the appr
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('Defaulters'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('Online Sessions'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('My Tasks'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('Result'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('Library'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('Health'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      Divider(),
      ListTile(
        title: Text('Settings'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('0.0.1'),
        onTap: () {},
      )
    ];
  }
}
