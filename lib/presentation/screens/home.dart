import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lhu_tibetan_music_app/bloc/auth_cubit.dart';
import 'package:lhu_tibetan_music_app/presentation/screens/player_page.dart';
import 'package:lhu_tibetan_music_app/presentation/widget/tool_bar.dart';
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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Container(
            child: IconButton(
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
          ),
          IconButton(
            tooltip: 'Settings',
            enableFeedback: true,
            icon: Icon(
              Icons.play_arrow_rounded,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerPage(),
                  ));
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    NavBarItem(
                      icon: Icons.arrow_back_ios,
                    ),
                    NavBarItem(
                      icon: Icons.list,
                    )
                  ],
                ),
              ),
              ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          ApplicationUtil.getImage('music.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                        'some title display here',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColorLight),
                      ),
                      subtitle: Text(
                        'some sub title display here',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColorLight),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.3),
                            offset: Offset(5, 5),
                            spreadRadius: 3,
                            blurRadius: 20),
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(-5, -3),
                            spreadRadius: -4,
                            blurRadius: 15),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
