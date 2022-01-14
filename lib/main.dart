import 'package:dictionary_app/bloc/bloc_observer.dart';
import 'package:dictionary_app/bloc/cubit.dart';
import 'package:dictionary_app/repo/word_repo.dart';
import 'package:dictionary_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/states.dart';

void main()
{
  Bloc.observer =MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DictionaryCubit(WordRepository()),
      child: BlocConsumer<DictionaryCubit, DictionaryState>(
          listener: (context, state) {},
          builder: (context, state)
          {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.deepOrange,
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.blueGrey[900],
                primarySwatch: Colors.deepOrange,
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode:DictionaryCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: HomeScreen(),
            );
          }
      ),
    );
  }
}