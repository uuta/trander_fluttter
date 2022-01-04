import '/import.dart';
import '/consts/api.dart';

class CityRepository {
  Future<Response> getCity(Map<String, dynamic> params, String? idToken) async {
    return await Dio().get(dotenv.get('API_DOMMIN') + ConstsApi.cities,
        queryParameters: params,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": " Bearer $idToken",
        }));
  }
}