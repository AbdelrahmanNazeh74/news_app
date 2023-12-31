// Bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/registration/auth_repository.dart';
import 'package:news_app/registration/login-bloc/login_event.dart';
import 'package:news_app/registration/login-bloc/login_state.dart';

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
      emit(const LoginFailure(error: 'Login failed'));
    }
  }
}
