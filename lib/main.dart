import 'package:bloc_08_00/bloc/cats_bloc.dart';
import 'package:bloc_08_00/cats_repo.dart';
import 'package:bloc_08_00/cats_screen.dart';
import 'package:bloc_08_00/dio_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) =>
              CatsRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) => CatsBloc(
          repo: RepositoryProvider.of<CatsRepo>(context),
        ),
        child: const MaterialApp(
          home: CatsScreen(),
        ),
      ),
    );
  }
}
