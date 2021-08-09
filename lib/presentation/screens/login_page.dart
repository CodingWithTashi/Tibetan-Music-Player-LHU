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
      backgroundColor: Theme.of(context).primaryColor,

      //backgroundColor: Color(0xffF5F5F5),

      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context)
                              .primaryColorLight
                              .withOpacity(0.4),
                          offset: Offset(7, 7),
                          spreadRadius: 5,
                          blurRadius: 10),
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(-3, -4),
                          spreadRadius: -2,
                          blurRadius: 10),
                    ],
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    'LHU (Tibetan Music App)',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .primaryColorLight
                                    .withOpacity(0.4),
                                offset: Offset(7, 7),
                                spreadRadius: 5,
                                blurRadius: 10),
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(-3, -4),
                                spreadRadius: -2,
                                blurRadius: 10),
                          ],
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                constraints: BoxConstraints(maxHeight: 400),
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .primaryColorLight
                                    .withOpacity(0.4),
                                offset: Offset(7, 7),
                                spreadRadius: 5,
                                blurRadius: 10),
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(-3, -4),
                                spreadRadius: -2,
                                blurRadius: 10),
                          ],
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'More app from kharag edition',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
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
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      child: Image.asset(
                                        ApplicationUtil.getImage('music.png'),
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      child: Image.asset(
                                        ApplicationUtil.getImage('music.png'),
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      child: Image.asset(
                                        ApplicationUtil.getImage('music.png'),
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      child: Image.asset(
                                        ApplicationUtil.getImage('music.png'),
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputButton() => Column(
        children: [
          /*TextField(
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
          ),*/
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
