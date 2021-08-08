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
                                height: 400,
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
                                  height: 280,
                                  width: 250,
                                ),
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

  Widget _buildInputButton() => SignInButton(
        Buttons.Google,
        text: "Sign in with Google",
        onPressed: () async {
          await authCubit.signInWithGmail();
        },
      );
}
