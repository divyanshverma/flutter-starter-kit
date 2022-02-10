import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:test_flutter_app/activity.dart';
import 'package:test_flutter_app/schedule.dart';
import 'attendance.dart';
import 'auth.dart';
import 'camera_screen.dart';
import 'captures_screen.dart';
import 'drawer.dart';
import 'file_picker.dart';
import 'camera.dart';
import 'services/take_picture_page.dart';
// import 'tusupload.dart';
var firstCamera = null;
/// This is the stateful widget that the main application instantiates.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _path = '';

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    ActivityWidget(),
    AttendanceWidget(),
    FilePickerFeature(),
    // CameraApp(),
    CameraScreen(),
    // _MyStatelessWidget(),
    ScheduleWidget()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            // body: _MyStatelessWidget(),
            icon: Icon(Icons.school),
            label: 'Notify',
          ),
          BottomNavigationBarItem(
            // body: _MyStatelessWidget(),
            icon: Icon(Icons.school),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            // body: _MyStatelessWidget(),
            icon: Icon(Icons.school),
            label: 'Schedule',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class _MyStatelessWidget extends StatelessWidget {

  const _MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notify'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
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
              child: Text('It\'s cloudy here'),
            ),
            Center(
                child: Text('It\'s sunny here'),
            ),
            Center(
              child: Text('It\'s sunny here'),
            ),
          ],
        ),
      ),
    );
  }
}
