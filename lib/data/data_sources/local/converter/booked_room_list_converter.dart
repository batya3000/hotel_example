import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:hotel/data/model/cart_room_model.dart';


class BookedRoomListConverter extends TypeConverter<List<CartRoomModel>, String> {
  @override
  List<CartRoomModel> decode(String databaseValue) {
    final jsonList = jsonDecode(databaseValue) as List;

    return jsonList.map((json) => CartRoomModel.fromJson(json)).toList();
  }

  @override
  String encode(List<CartRoomModel> value) {
    final jsonList = value.map((room) => room.toJson()).toList();
    return jsonEncode(jsonList);
  }

}