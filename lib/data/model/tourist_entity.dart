import 'package:floor/floor.dart';
import 'package:hotel/core/constants/constants.dart';
import 'package:hotel/data/model/cart_room_model.dart';

@Entity(tableName: touristTable)
class TouristEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String phone;
  final String email;
  final String firstName;
  final String lastName;
  final List<CartRoomModel> rooms;

  const TouristEntity({
    required this.id,
    required this.phone,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.rooms
  });

}