import 'package:dio/dio.dart';
import '../model/character_model.dart';

class CharacterRepository {
  final Dio dio;

  CharacterRepository(this.dio);

  Future<List<CharacterModel>> fetchCharacters() async {
    final response = await dio.get(
      'https://rickandmortyapi.com/api/character',
    );

    return (response.data['results'] as List)
        .map((item) => CharacterModel.fromJson(item))
        .toList();
  }
}
