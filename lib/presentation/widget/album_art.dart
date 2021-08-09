import 'package:flutter/material.dart';
import 'package:lhu_tibetan_music_app/utils/application_util.dart';

class AlbumArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            ApplicationUtil.getImage('music.png'),
            fit: BoxFit.fill,
          )),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColorLight.withAlpha(80),
              offset: Offset(20, 8),
              spreadRadius: 3,
              blurRadius: 25),
          BoxShadow(
              color: Colors.black,
              offset: Offset(-3, -5),
              spreadRadius: -2,
              blurRadius: 20)
        ],
      ),
    );
  }
}
