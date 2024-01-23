


import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/domain/repository/tourist_repository.dart';

class RemoveRoomFromCartUseCase {
  final TouristRepository _touristRepository;

  RemoveRoomFromCartUseCase(this._touristRepository);

  Future<void> call(CartRoom cartRoom) {
    return _touristRepository.removeRoomFromCart(cartRoom);
  }
}
