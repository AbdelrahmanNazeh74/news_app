import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/registration/login-bloc/user_login_event.dart';
import 'package:news_app/registration/login-bloc/user_login_state.dart';
import 'package:news_app/registration/reposoitory/auth_repository.dart';

// Bloc
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed); // Register the handler
  }
  // Handler for the LoginButtonPressed event
  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      await authRepository.login(event.username, event.password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(error: 'Login failed'));
    }
  }
 
}
