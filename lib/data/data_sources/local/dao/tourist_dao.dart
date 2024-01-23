

import 'package:floor/floor.dart';
import 'package:hotel/core/constants/constants.dart';
import 'package:hotel/data/model/tourist_entity.dart';

@dao
abstract class TouristDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTourist(TouristEntity tourist);

  @Query("SELECT * FROM $touristTable")
  Stream<List<TouristEntity>> getTourists();

  @Query("SELECT * FROM $touristTable WHERE id =:touristId")
  Future<TouristEntity?> getTouristsById(int touristId);

  @Query("DELETE FROM $touristTable WHERE id =:touristId")
  Future<void> removeTouristById(int touristId);

  @update
  Future<void> updateTourist(TouristEntity tourist);
}