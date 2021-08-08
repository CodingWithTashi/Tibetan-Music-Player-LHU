import 'package:flutter/material.dart';
import 'package:lhu_tibetan_music_app/animation/show_down_anim.dart';
import 'package:lhu_tibetan_music_app/animation/show_left_anim.dart';
import 'package:lhu_tibetan_music_app/animation/show_up_anim.dart';
import 'package:lhu_tibetan_music_app/presentation/screens/on_boarding_page.dart';
import 'package:lhu_tibetan_music_app/utils/app_constant.dart';

class SplashScreenPage extends StatefulWidget {
  static const String routeName = '/splash';
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.pop(context);
      Navigator.pushNamed(context, OnBoardingPage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Stack(
          children: [
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getFlagImage(),
                    _getAppName(),
                    _getEditorName(),
                  ],
                ),
              ),
            ),
            _getProgressBarAndVersion()
          ],
        ),
      ),
    );
  }

  _getFlagImage() => ShowDownAnimation(
        child: Container(child: Image.asset('assets/images/flag.png')),
        delay: 500,
      );

  _getAppName() => ShowUpAnimation(
        child: Container(
          child: Text(
            AppConstant.APP_NAME,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        delay: 500,
      );

  _getVersionName() => Container(
        padding: EdgeInsets.all(10),
        child: Text(
          'Ver: ${AppConstant.VERSION_NO}',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      );

  _getProgressBarAndVersion() => Stack(
        alignment: Alignment.bottomRight,
        children: [
          _getVersionName(),
          _getProgressBarWithLoadingText(),
        ],
      );

  _getEditorName() => ShowUpAnimation(
        child: Container(
          child: Text(
            'By ' + AppConstant.EDITOR,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        delay: 500,
      );

  _getProgressBarWithLoadingText() => Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Loading...',
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
            ],
          ),
        ),
      );
}
