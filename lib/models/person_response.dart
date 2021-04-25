import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_bloc_provider/models/person.dart';

class PersonResponseModel {
  List<PersonModel> persons;
  String error;
  PersonResponseModel({@required this.persons});

  PersonResponseModel.fromApi(Map<String, dynamic> json) {
    try {
      persons = (json['results'] as List)
          .map((person) => new PersonModel.fromJson(person))
          .toList();
      error = '';
    } catch (errorValue) {
      error = errorValue;
      rethrow;
    }
  }
}
