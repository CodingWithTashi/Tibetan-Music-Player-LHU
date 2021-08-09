import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lhu_tibetan_music_app/bloc/auth_cubit.dart';
import 'package:lhu_tibetan_music_app/presentation/screens/home.dart';
import 'package:lhu_tibetan_music_app/repository/auth_repository.dart';
import 'package:lhu_tibetan_music_app/utils/application_util.dart';
import 'package:lhu_tibetan_music_app/utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<FirebaseAuthRepository>(
      create: (context) => FirebaseAuthRepository(),
      child: BlocProvider<AuthCubit>(
        create: (context) {
          var authRepo = RepositoryProvider.of<FirebaseAuthRepository>(context);
          return AuthCubit(authRepo);
        },
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener}
          },
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: ApplicationUtil.createMaterialColor(
                  Color(0xff795C22),
                ),
                primaryColorLight: Color(0xffF6C970)),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        ),
      ),
    );
  }
}
