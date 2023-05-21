import 'package:dio/dio.dart';
import 'package:projet_flutter_dar_2023/data/models/meteo_model.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://api.weatherapi.com/v1/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("current.json")
  Future<MeteoModel> getMeteo(
    @Query("key") String apiKey,
    @Query("q") String city,
    @Query("aqi") String aqi,
  );
}
