


import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/domain/repository/tourist_repository.dart';

class AddRoomToCartUseCase {
  final TouristRepository _touristRepository;

  AddRoomToCartUseCase(this._touristRepository);

  Future<void> call(CartRoom cartRoom) {
    return _touristRepository.addRoomToCart(cartRoom);
  }
}
