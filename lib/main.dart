import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/routing/routing.dart';
import 'package:news_app/features/main/bloc/routing/app_routing_bloc.dart';
import 'package:news_app/features/main/bloc/routing/app_routing_states.dart';
import 'package:news_app/features/news/ui/screens/news_screen.dart';
import 'package:news_app/features/settings/ui/screens/settings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _blocProvider,
    );
  }

  Widget get _blocProvider => BlocProvider<AppRoutingBloc>(
    create: (context) => AppRoutingBloc(),
    child: _blocConsumer,
  );

  Widget get _blocConsumer => BlocConsumer<AppRoutingBloc, AppRoutingState>(
    listener: (context, state) {
      if (state is AppRoutingStateSettings) {
        showScreen(context, SettingsScreen());
      }
    },
    builder: (context, state) {
      return NewsScreen();
    },
  );
}
