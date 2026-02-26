import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/feature/home/data/datasource/DetailRemoteDataSource.dart';
import 'package:flutter_bloc_demo/feature/home/domain/repository/DetailRepository.dart';
import 'package:flutter_bloc_demo/feature/home/presentation/bloc/detail/DetailBloc.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';
import 'feature/auth/data/datasource/AuthRemoteDataSource.dart';
import 'feature/auth/data/repository/AuthRepositoryImpl.dart';
import 'feature/auth/domain/repository/AuthRepository.dart';
import 'feature/auth/presentation/bloc/auth/AuthBloc.dart';
import 'feature/auth/presentation/pages/login_page.dart';
import 'feature/home/data/datasource/HomeRemoteDataSource.dart';
import 'feature/home/data/repository/DetailRepositoryImpl.dart';
import 'feature/home/data/repository/HomeRepositoryImpl.dart';
import 'feature/home/domain/repository/HomeRepository.dart';
import 'feature/home/presentation/bloc/home/HomeBloc.dart';
import 'feature/home/presentation/pages/detail_page.dart';
import 'feature/home/presentation/pages/home_page.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(getIt<AuthRepository>())),
        BlocProvider(create: (_) => HomeBloc(getIt<HomeRepository>())),
        BlocProvider(create: (_) => DetailBloc(getIt<DetailRepository>())),
      ],
      child: const MyApp(),
    );
  }
}

void setup() {
  getIt.registerLazySingleton<Dio>(() => DioClient.createDio());

  //auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );

  //home
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(getIt()),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );

  //detail
  getIt.registerLazySingleton<DetailRemoteDataSource>(
    () => DetailRemoteDataSource(getIt()),
  );

  getIt.registerLazySingleton<DetailRepository>(
    () => DetailRepositoryImpl(getIt()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc App',

      initialRoute: '/home',

      routes: {
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final coinId = settings.arguments as String;

          return MaterialPageRoute(
            builder: (_) => DetailPage(coinId: coinId),
          );
        }
        return null;
      },
    );
  }
}
