import 'package:hotel/data/model/cart_room_model.dart';
import 'package:hotel/data/model/room_response.dart';
import 'package:hotel/data/model/tourist_entity.dart';
import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/domain/model/room.dart';
import 'package:hotel/domain/model/tourist.dart';


extension ResponseToDomain on RoomResponse {
  Room toDomain() {
    return Room(
      id: id,
      title: title,
      imageUrl: imageUrl,
      pricePerDay: pricePerDay,
      capacity: capacity,
    );
  }
}

extension TouristEntityToDomain on TouristEntity {
  Tourist toDomain() {
    return Tourist(
        id: id,
        phone: phone,
        email: email,
        firstName:  firstName,
        lastName: lastName,
        rooms: rooms.map((it) => it.toDomain()).toList()
    );
  }
}

extension CartRoomModelToDomain on CartRoomModel {
  CartRoom toDomain() {
    return CartRoom(
        touristId: touristId,
        title: title,
        imageUrl: imageUrl,
        pricePerDay: pricePerDay,
        fromDay: fromDay,
        toDay: toDay,
        capacity: capacity
    );
  }
}

extension TouristToData on Tourist {
  TouristEntity toData() {
    return TouristEntity(
        id: id,
        phone: phone,
        email: email,
        firstName:  firstName,
        lastName: lastName,
        rooms: rooms.map((it) => it.toData()).toList()
    );
  }
}

extension CartRoomToData on CartRoom {
  CartRoomModel toData() {
    return CartRoomModel(
        touristId: touristId,
        title: title,
        imageUrl: imageUrl,
        pricePerDay: pricePerDay,
        fromDay: fromDay,
        toDay: toDay,
        capacity: capacity
    );
  }
}
