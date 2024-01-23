// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TouristDao? _touristDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tourist_table` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `phone` TEXT NOT NULL, `email` TEXT NOT NULL, `firstName` TEXT NOT NULL, `lastName` TEXT NOT NULL, `rooms` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TouristDao get touristDao {
    return _touristDaoInstance ??= _$TouristDao(database, changeListener);
  }
}

class _$TouristDao extends TouristDao {
  _$TouristDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _touristEntityInsertionAdapter = InsertionAdapter(
            database,
            'tourist_table',
            (TouristEntity item) => <String, Object?>{
                  'id': item.id,
                  'phone': item.phone,
                  'email': item.email,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'rooms': _bookedRoomListConverter.encode(item.rooms)
                },
            changeListener),
        _touristEntityUpdateAdapter = UpdateAdapter(
            database,
            'tourist_table',
            ['id'],
            (TouristEntity item) => <String, Object?>{
                  'id': item.id,
                  'phone': item.phone,
                  'email': item.email,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'rooms': _bookedRoomListConverter.encode(item.rooms)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TouristEntity> _touristEntityInsertionAdapter;

  final UpdateAdapter<TouristEntity> _touristEntityUpdateAdapter;

  @override
  Stream<List<TouristEntity>> getTourists() {
    return _queryAdapter.queryListStream('SELECT * FROM tourist_table',
        mapper: (Map<String, Object?> row) => TouristEntity(
            id: row['id'] as int?,
            phone: row['phone'] as String,
            email: row['email'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            rooms: _bookedRoomListConverter.decode(row['rooms'] as String)),
        queryableName: 'tourist_table',
        isView: false);
  }

  @override
  Future<TouristEntity?> getTouristsById(int touristId) async {
    return _queryAdapter.query('SELECT * FROM tourist_table WHERE id =?1',
        mapper: (Map<String, Object?> row) => TouristEntity(
            id: row['id'] as int?,
            phone: row['phone'] as String,
            email: row['email'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            rooms: _bookedRoomListConverter.decode(row['rooms'] as String)),
        arguments: [touristId]);
  }

  @override
  Future<void> removeTouristById(int touristId) async {
    await _queryAdapter.queryNoReturn('DELETE FROM tourist_table WHERE id =?1',
        arguments: [touristId]);
  }

  @override
  Future<void> insertTourist(TouristEntity tourist) async {
    await _touristEntityInsertionAdapter.insert(
        tourist, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateTourist(TouristEntity tourist) async {
    await _touristEntityUpdateAdapter.update(tourist, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _bookedRoomListConverter = BookedRoomListConverter();
