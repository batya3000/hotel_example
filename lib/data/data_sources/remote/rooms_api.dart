
import 'package:hotel/data/model/room_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/constants.dart';

part 'rooms_api.g.dart';


@RestApi(baseUrl: roomsBaseUrl)
abstract class RoomsApi {
  factory RoomsApi(Dio dio) = _RoomsApi;

  @GET("/rooms")
  Future<HttpResponse<List<RoomResponse>>> getRooms();
}