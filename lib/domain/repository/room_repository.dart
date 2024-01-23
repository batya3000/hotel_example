


import 'package:hotel/core/result/result.dart';
import 'package:hotel/domain/model/room.dart';

abstract class RoomRepository {

  // API
  Future<Result<List<Room>>> getRooms();

}