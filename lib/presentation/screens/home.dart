import 'package:flutter/material.dart';
import 'package:lhu_tibetan_music_app/utils/application_util.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ApplicationUtil.getAppbarCurvePainter(context),
          Center(
            child: Container(
              child: Column(
                children: [],
              ),
            ),
          )
        ],
      ),
    );
  }
}
