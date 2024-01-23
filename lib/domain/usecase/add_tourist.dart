
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/domain/repository/tourist_repository.dart';

class AddTouristUseCase {
  final TouristRepository _touristRepository;

  AddTouristUseCase(this._touristRepository);

  Future<void> call(Tourist tourist) {
    return _touristRepository.addTourist(tourist);
  }
}