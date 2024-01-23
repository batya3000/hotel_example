

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_room_model.g.dart';

@JsonSerializable()
class CartRoomModel extends Equatable {
  final int touristId;
  final String title;
  final String imageUrl;
  final int pricePerDay;
  final String fromDay;
  final String toDay;
  final int capacity;


  const CartRoomModel({
    required this.touristId,
    required this.title,
    required this.imageUrl,
    required this.pricePerDay,
    required this.fromDay,
    required this.toDay,
    required this.capacity
  });

  @override
  List<Object> get props => [touristId, title, imageUrl, pricePerDay, fromDay, toDay, capacity];

  factory CartRoomModel.fromJson(Map<String, dynamic> json) =>
      _$CartRoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartRoomModelToJson(this);
}