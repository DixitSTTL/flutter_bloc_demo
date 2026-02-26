import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/AuthRepository.dart';
import 'AuthEvent.dart';
import 'AuthState.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final AuthRepository repository;
//
//   AuthBloc(this.repository) : super(const AuthState()) {
//     on<LoginRequested>(_onLoginRequested);
//   }
//
//   Future<void> _onLoginRequested(
//       LoginRequested event,
//       Emitter<AuthState> emit,
//       ) async {
//     emit(state.copyWith(isLoading: true, error: null));
//
//     try {
//       final user = await repository.login(
//         event.email,
//         event.password,
//       );
//
//       emit(state.copyWith(
//         isLoading: false,
//         user: user,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         isLoading: false,
//         error: e.toString(),
//       ));
//     }
//   }
// }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(const AuthState()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  // AuthBloc(this.repository) : super(const AuthState()) {
  //   on<LoginRequested>(_onLoginRequested);
  // }
  // AuthBloc(super.initialState, {required this.repository});

  FutureOr<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    debugPrint(event.props.toString());
    try {
      final user = await repository.login(event.email, event.password);
      emit(state.copyWith(isLoading: false, user: user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  FutureOr<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    debugPrint(event.props.toString());
  }
}
