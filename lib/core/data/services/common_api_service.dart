import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'common_api_service.g.dart';

@RestApi()
abstract class CommonApiService {
  factory CommonApiService(Dio dio, {String baseUrl}) = _CommonApiService;

  @POST('api/user/get_distributor_detail')
  Future<HttpResponse<String>> fetchDistributorDetails(@Body() Map<String, dynamic> body);

  @POST('api/all_flags')
  Future<HttpResponse<String>> allFlags(@Body() Map<String, dynamic> body);

  @POST('api/basic_info')
  Future<HttpResponse<String>> basicInfo(@Body() Map<String, dynamic> body);

  @POST('api/switches_for_app')
  Future<HttpResponse<String>> switches(@Body() Map<String, dynamic> body);


}
