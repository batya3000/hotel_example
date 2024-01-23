import 'package:hotel/core/result/result.dart';
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/domain/repository/tourist_repository.dart';

class GetTouristsUseCase {
  final TouristRepository _touristRepository;

  GetTouristsUseCase(this._touristRepository);

  Stream<Result<List<Tourist>>> call() {
    return _touristRepository.getTourists();
  }
}