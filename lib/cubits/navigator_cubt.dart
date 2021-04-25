import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_bloc_provider/models/person.dart';

class NavigatorCubit extends Cubit<PersonModel> {
  NavigatorCubit() : super(null);

  void showDetailPersons(PersonModel model) => emit(model);

  void backToMainScreen() => emit(null);
}
