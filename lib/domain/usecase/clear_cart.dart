


import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/domain/repository/tourist_repository.dart';

class ClearCartUseCase {
  final TouristRepository _touristRepository;

  ClearCartUseCase(this._touristRepository);

  Future<void> call(List<CartRoom> cartItems) {
    return _touristRepository.clearCart(cartItems);
  }
}
