import 'package:flutter/material.dart';
import 'package:lhu_tibetan_music_app/presentation/widget/album_art.dart';
import 'package:lhu_tibetan_music_app/presentation/widget/player_controls.dart';
import 'package:lhu_tibetan_music_app/presentation/widget/tool_bar.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  double sliderValue = 2;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          NavigationBar(),
          Container(
            margin: EdgeInsets.only(left: 40),
            height: height / 2.5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Center(child: AlbumArt());
              },
              itemCount: 1,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Text(
            'Gidget',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColorLight),
          ),
          Text(
            'The Free Nationals',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColorLight),
          ),
          Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                    trackHeight: 5,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
                child: Slider(
                  value: 10.9,
                  activeColor: Theme.of(context).primaryColorLight,
                  inactiveColor:
                      Theme.of(context).primaryColorLight.withOpacity(0.4),
                  onChanged: (value) {},
                  min: 0,
                  max: 20,
                ),
              ),
            ],
          ),
          PlayerControls(),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
