
import 'package:json_annotation/json_annotation.dart';

part 'room_response.g.dart';


@JsonSerializable()
class RoomResponse {
  final int id;
  final String title;
  final String imageUrl;
  final int pricePerDay;
  final int capacity;

  RoomResponse({required this.id, required this.title, required this.imageUrl, required this.pricePerDay, required this.capacity});

  factory RoomResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomResponseFromJson(json);
}