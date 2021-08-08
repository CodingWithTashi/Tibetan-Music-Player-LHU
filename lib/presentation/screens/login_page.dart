import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:lhu_tibetan_music_app/bloc/auth_cubit.dart';
import 'package:lhu_tibetan_music_app/presentation/screens/home.dart';
import 'package:lhu_tibetan_music_app/utils/application_util.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  AuthCubit get authCubit => context.read<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.dark,
        elevation: 0,
        title: Text('LHU (Tibetan Music App)'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Settings',
            enableFeedback: true,
            icon: Icon(
              CupertinoIcons.gear_alt_fill,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          ApplicationUtil.getAppbarCurvePainter(context),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                constraints: BoxConstraints(maxHeight: 600),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BlocConsumer<AuthCubit, AuthState>(
                                        listener: (context, state) {
                                          if (state is AuthLoaded) {
                                            Navigator.pushReplacementNamed(
                                                context, HomePage.routeName);
                                          }
                                        },
                                        builder: (context, state) {
                                          return BlocBuilder<AuthCubit,
                                              AuthState>(
                                            builder: (context, state) {
                                              if (state is AuthInitial) {
                                                return _buildInputButton();
                                              } else if (state is AuthLoading) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              } else if (state is AuthError) {
                                                return Center(
                                                    child: Text(state.error));
                                              } else {
                                                return _buildInputButton();
                                              }
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Why sign in is required?',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(180)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Image.asset(
                                  ApplicationUtil.getImage('login.png'),
                                  height: 300,
                                  width: 250,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'More app from kharag edition',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: <Widget>[
                                  Card(
                                    child: Container(
                                      child: Image.asset(
                                        ApplicationUtil.getImage('music.png'),
                                        height: 70,
                                        width: 70,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      child: Image.asset(
                                        ApplicationUtil.getImage('music.png'),
                                        height: 70,
                                        width: 70,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      child: Image.asset(
                                        ApplicationUtil.getImage('music.png'),
                                        height: 70,
                                        width: 70,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      child: Image.asset(
                                        ApplicationUtil.getImage('music.png'),
                                        height: 70,
                                        width: 70,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      child: Image.asset(
                                        ApplicationUtil.getImage('music.png'),
                                        height: 70,
                                        width: 70,
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInputButton() => Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintText: "Enter email",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.security),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Enter Password",
                fillColor: Colors.white70),
            obscureText: true,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(' Login with Email & Password '),
          ),
          SizedBox(
            height: 10,
          ),
          SignInButton(
            Buttons.Google,
            text: "Sign in with Google",
            onPressed: () async {
              await authCubit.signInWithGmail();
            },
          ),
        ],
      );
}
