
import 'dart:io';

import 'package:hotel/core/result/result.dart';
import 'package:hotel/data/data_sources/remote/rooms_api.dart';
import 'package:hotel/data/mapper/mappers.dart';
import 'package:hotel/domain/model/room.dart';
import 'package:hotel/domain/repository/room_repository.dart';


class RoomRepositoryImpl implements RoomRepository {
  final RoomsApi _roomsApi;

  RoomRepositoryImpl(this._roomsApi);

  @override
  Future<Result<List<Room>>> getRooms() async {
    try {
      var httpResponse = await _roomsApi.getRooms();

      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return Success(
            httpResponse.data.map((response) => response.toDomain() ).toList()
        );
      } else {
        return Failure(
            httpResponse.response.statusMessage ?? "HttpStatus != ok"
        );
      }

    } catch (exception) {
      return Failure(exception.toString());
    }
  }
}