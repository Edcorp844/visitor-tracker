import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:visitortracker/Handlers/network_monitor.dart';
import 'package:visitortracker/controllers/core/about_controller.dart';
import 'package:visitortracker/controllers/core/home_controller.dart';
import 'package:visitortracker/controllers/core/maps_controller.dart';
import 'package:visitortracker/resources/no_internet_controller.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({Key? key}) : super(key: key);

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int _selectedindex = 0;

  final List<Widget> _widgetOptions = [
    const HomePage(),
    const MapPage(),
    const AboutPage()
  ];

  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;

  void _onItemTap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  void initState() {
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget widget;
    final Widget widget1;
    //final Widget widget2 = noInternet();

    widget1 = Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: IndexedStack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedindex),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF303030).withOpacity(0.4),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.language_outlined), label: 'Map'),
          BottomNavigationBarItem(
              icon: Icon(Icons.miscellaneous_services_outlined),
              label: 'Settings'),
        ],
        currentIndex: _selectedindex,
        onTap: _onItemTap,
      ),
    );

    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        widget = widget1;
        break;
      case ConnectivityResult.wifi:
        widget = widget1;
        break;
      case ConnectivityResult.none:
      default:
        widget = widget1;
    }

    return widget;
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }
}
