import 'package:dio/dio.dart';
import '../model/paginated_character_response.dart';

class CharacterRepository {
  final Dio dio;

  CharacterRepository(this.dio);

  Future<PaginatedCharacterResponse> fetchCharacters({int page = 1}) async {
    final response = await dio.get(
      'https://rickandmortyapi.com/api/character?page=$page',
    );

    return PaginatedCharacterResponse.fromJson(response.data);
  }
}
