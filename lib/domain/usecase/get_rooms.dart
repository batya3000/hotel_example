
import 'package:hotel/core/result/result.dart';
import 'package:hotel/domain/model/room.dart';
import 'package:hotel/domain/repository/room_repository.dart';

class GetRoomsUseCase {
  final RoomRepository _roomRepository;

  GetRoomsUseCase(this._roomRepository);

  Future<Result<List<Room>>> call() {
    return _roomRepository.getRooms();
  }

}