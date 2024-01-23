import 'package:hotel/domain/repository/tourist_repository.dart';

class RemoveTouristByIdUseCase {
  final TouristRepository _touristRepository;

  RemoveTouristByIdUseCase(this._touristRepository);

  Future<void> call(int touristId) {
    return _touristRepository.removeTouristById(touristId);
  }
}