import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lhu_tibetan_music_app/bloc/auth_cubit.dart';
import 'package:lhu_tibetan_music_app/utils/application_util.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthCubit get authCubit => BlocProvider.of<AuthCubit>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            tooltip: 'Settings',
            enableFeedback: true,
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              authCubit.emit(AuthLogout());
            },
          ),
        ],
      ),
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
