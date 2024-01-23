
import 'package:floor/floor.dart';
import 'package:hotel/data/data_sources/local/converter/booked_room_list_converter.dart';
import 'package:hotel/data/data_sources/local/dao/tourist_dao.dart';
import 'package:hotel/data/model/tourist_entity.dart';

import 'package:sqflite/sqlite_api.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [TouristEntity])
@TypeConverters([BookedRoomListConverter])
abstract class AppDatabase extends FloorDatabase {
  TouristDao get touristDao;

}