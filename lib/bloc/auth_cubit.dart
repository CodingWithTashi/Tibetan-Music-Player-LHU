import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lhu_tibetan_music_app/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitial());

  signInWithGmail() async {
    emit(AuthInitial());
    emit(AuthLoading());
    try {
      UserCredential credential = await authRepository.loginWithGmail();
      emit(AuthLoaded(credential));
    } catch (e) {
      print(e);
      emit(AuthError(e.toString()));
      Future.delayed(Duration(seconds: 2), () {
        emit(AuthInitial());
      });
    }
  }
}
