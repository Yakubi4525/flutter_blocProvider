import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:rick_and_morty_bloc_provider/blocs/person_bloc_models.dart';
import 'package:rick_and_morty_bloc_provider/repository/data_service.dart';

class GetPersonsBloc extends Bloc<PersonEvents, PersonStates> {
  GetPersonsBloc() : super(LoadingPersonState());

  @override
  Stream<PersonStates> mapEventToState(PersonEvents event) async* { 
    final _dataService = DataService();
    Connectivity connectivity = Connectivity();
    if (event is LoadPersonEvent || event is RefreshPageEvent) {
      yield LoadingPersonState();
      try {
        ConnectivityResult connect = await connectivity.checkConnectivity();
        if (connect != ConnectivityResult.none) {
          final persons = await _dataService.getListOfPersons();
          yield SuccesPersonState(personResponse: persons);
        } else
          yield NoInternetPersonState();
      } catch (errorValue) {
        yield FailedPersonState(error: errorValue);
      }
    }
  }
}
