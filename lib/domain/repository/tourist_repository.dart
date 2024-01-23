


import 'package:hotel/core/result/result.dart';
import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/domain/model/tourist.dart';

abstract class TouristRepository {

  Stream<Result<List<Tourist>>> getTourists();
  Future<Result<Tourist>> getTouristById(int id);

  Future<void> addTourist(Tourist tourist);

  Future<void> removeTouristById(int id);

  Future<void> updateTourist(Tourist tourist);

  Future<void> clearCart(List<CartRoom> cartItems);

  Future<void> addRoomToCart(CartRoom cartRoom);
  Future<void> removeRoomFromCart(CartRoom cartRoom);


}