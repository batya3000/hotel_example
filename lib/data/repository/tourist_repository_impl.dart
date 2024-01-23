import 'package:hotel/core/result/result.dart';
import 'package:hotel/data/data_sources/local/dao/tourist_dao.dart';
import 'package:hotel/data/mapper/mappers.dart';
import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/domain/repository/tourist_repository.dart';


class TouristRepositoryImpl implements TouristRepository {
  final TouristDao _touristDao;

  TouristRepositoryImpl(this._touristDao);

  @override
  Future<Result<Tourist>> getTouristById(int id) async {
    try {
      final tourist = await _touristDao.getTouristsById(id);
      if(tourist != null) {
        return Success(
          tourist.toDomain()
        );
      } else {
        return const Failure("No tourist with this id");
      }
    } catch(exception) {
      return Failure(exception.toString());
    }
  }

  @override
  Stream<Result<List<Tourist>>> getTourists() {
    final tourists = _touristDao.getTourists();

    return tourists.map((list) {
      return Success(
          list.map((it) => it.toDomain()).toList()
      );
    }).handleError((exception) {
      return Failure(exception.toString());
    });
  }

  @override
  Future<void> addTourist(Tourist tourist) {
    return _touristDao.insertTourist(tourist.toData());
  }

  @override
  Future<void> removeTouristById(int touristId) async {
    await _touristDao.removeTouristById(touristId);
  }

  @override
  Future<void> updateTourist(Tourist tourist) async {
    await _touristDao.updateTourist(tourist.toData());
  }


  @override
  Future<void> addRoomToCart(CartRoom cartRoom) async {
    final tourist = await _touristDao.getTouristsById(cartRoom.touristId);
    if (tourist != null) {
      tourist.rooms.add(cartRoom.toData());

      await _touristDao.updateTourist(tourist);
    }
  }

  @override
  Future<void> removeRoomFromCart(CartRoom cartRoom) async {
    final tourist = await _touristDao.getTouristsById(cartRoom.touristId);
    if (tourist != null) {
      tourist.rooms.remove(cartRoom.toData());

      await _touristDao.updateTourist(tourist);
    }
  }

  @override
  Future<void> clearCart(List<CartRoom> cartItems) async {
    Set<int> touristIds = Set.of(
        cartItems.map((it) => it.touristId)
    );

    for(int id in touristIds) {
      final tourist = await _touristDao.getTouristsById(id);
      if (tourist != null) {
        tourist.rooms.clear();

        await _touristDao.updateTourist(tourist);
      }
    }
  }
}