

import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/domain/repository/tourist_repository.dart';

class UpdateTouristUseCase {
  final TouristRepository _touristRepository;

  UpdateTouristUseCase(this._touristRepository);

  Future<void> call(Tourist tourist) {
    return _touristRepository.updateTourist(tourist);
  }
}