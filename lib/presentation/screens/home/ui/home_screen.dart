import 'package:flutter/material.dart';
import 'package:flutter_firebase_remote_config/business_logic/SDUI/widget_map.dart';
import 'package:flutter_firebase_remote_config/data/services/firebase/remote_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> serverWidgets = [];

  @override
  void initState() {
    super.initState();
    getVal();
  }

  getVal() async {
    var serverJsonList = (await FirebaseRemoteConfigClass().initializeConfig());
    setState(() {
      serverWidgets = MapDataToWidget().mapWidgets(serverJsonList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Flutter Firebase Remote Config',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [...serverWidgets],
          ),
        ),
      ),
    );
  }
}
