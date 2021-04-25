import 'package:dio/dio.dart';
import 'package:rick_and_morty_bloc_provider/models/person_response.dart';

class DataService {
  static String mainUrl = "https://rickandmortyapi.com";
  final Dio _dio = Dio(BaseOptions(baseUrl: mainUrl));

  Future<PersonResponseModel> getListOfPersons() async {
    try {
      final response = await _dio.get('/api/character?page=1');
      if (response.statusCode == 200) {
        return PersonResponseModel.fromApi(response.data);
      }
      throw Exception("Ошибка запроса");
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
