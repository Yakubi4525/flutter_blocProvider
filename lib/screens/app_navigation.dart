import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_bloc_provider/cubits/navigator_cubt.dart';
import 'package:rick_and_morty_bloc_provider/models/person.dart';
import 'package:rick_and_morty_bloc_provider/screens/detail_screen.dart';
import 'package:rick_and_morty_bloc_provider/screens/main_screen.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorCubit, PersonModel>(builder: (context, model) {
      if (model != null) {
        return DetailScreen(
          model: model,
        );
      }
      return MainScreen();
    });
  }
}
