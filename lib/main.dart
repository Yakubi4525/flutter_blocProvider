import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_bloc_provider/blocs/get_list_persons_blocs.dart';
import 'package:rick_and_morty_bloc_provider/blocs/person_bloc_models.dart';
import 'package:rick_and_morty_bloc_provider/cubits/navigator_cubt.dart';
import 'package:rick_and_morty_bloc_provider/screens/main_screen.dart';
import 'package:rick_and_morty_bloc_provider/styles/theme.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MyApp(),
    enabled: !kReleaseMode,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick anв Morty',
        theme: themeDark,
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => NavigatorCubit()),
          BlocProvider(
            create: (context) => GetPersonsBloc()..add(LoadPersonEvent()),
          ),
        ], child: MainScreen()));
  }
}
