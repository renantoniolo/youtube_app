import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_app/widgets/home.dart';

import 'blocs/videos_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => VideosBloc())],
      child: MaterialApp(
        title: 'Flutter Youtube',
        home: Home(),
      ),
    );
  }
}
