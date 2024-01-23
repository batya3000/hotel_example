// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartRoomModel _$CartRoomModelFromJson(Map<String, dynamic> json) =>
    CartRoomModel(
      touristId: json['touristId'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      pricePerDay: json['pricePerDay'] as int,
      fromDay: json['fromDay'] as String,
      toDay: json['toDay'] as String,
      capacity: json['capacity'] as int,
    );

Map<String, dynamic> _$CartRoomModelToJson(CartRoomModel instance) =>
    <String, dynamic>{
      'touristId': instance.touristId,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'pricePerDay': instance.pricePerDay,
      'fromDay': instance.fromDay,
      'toDay': instance.toDay,
      'capacity': instance.capacity,
    };
