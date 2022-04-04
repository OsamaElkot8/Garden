// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorLocalDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$LocalDatabaseBuilder databaseBuilder(String name) =>
      _$LocalDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$LocalDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$LocalDatabaseBuilder(null);
}

class _$LocalDatabaseBuilder {
  _$LocalDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$LocalDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$LocalDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<LocalDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$LocalDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$LocalDatabase extends LocalDatabase {
  _$LocalDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PlantsDao? _plantsDaoInstance;

  PlantsTypesDao? _plantsTypesDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `Plant` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `date` TEXT NOT NULL, `type` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PlantType` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PlantsDao get plantsDao {
    return _plantsDaoInstance ??= _$PlantsDao(database, changeListener);
  }

  @override
  PlantsTypesDao get plantsTypesDao {
    return _plantsTypesDaoInstance ??=
        _$PlantsTypesDao(database, changeListener);
  }
}

class _$PlantsDao extends PlantsDao {
  _$PlantsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _plantInsertionAdapter = InsertionAdapter(
            database,
            'Plant',
            (Plant item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'date': item.date,
                  'type': item.type
                }),
        _plantUpdateAdapter = UpdateAdapter(
            database,
            'Plant',
            ['id'],
            (Plant item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'date': item.date,
                  'type': item.type
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Plant> _plantInsertionAdapter;

  final UpdateAdapter<Plant> _plantUpdateAdapter;

  @override
  Future<List<Plant>> getPlants(int lastPlantRecordId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Plant where id > ?1 order by id limit 10',
        mapper: (Map<String, Object?> row) => Plant(
            id: row['id'] as int?,
            name: row['name'] as String,
            type: row['type'] as String,
            date: row['date'] as String),
        arguments: [lastPlantRecordId]);
  }

  @override
  Future<List<Plant>> searchPlants(String plantName) async {
    return _queryAdapter.queryList('SELECT * FROM Plant where name like ?1',
        mapper: (Map<String, Object?> row) => Plant(
            id: row['id'] as int?,
            name: row['name'] as String,
            type: row['type'] as String,
            date: row['date'] as String),
        arguments: [plantName]);
  }

  @override
  Future<void> deleteAllPlants() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Plant');
  }

  @override
  Future<void> resetPlantsAutoIncrement() async {
    await _queryAdapter
        .queryNoReturn('UPDATE sqlite_sequence SET seq = 0 WHERE name="Plant"');
  }

  @override
  Future<List<int>> insertPlants(List<Plant> plant) {
    return _plantInsertionAdapter.insertListAndReturnIds(
        plant, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatePlants(List<Plant> plant) {
    return _plantUpdateAdapter.updateListAndReturnChangedRows(
        plant, OnConflictStrategy.abort);
  }
}

class _$PlantsTypesDao extends PlantsTypesDao {
  _$PlantsTypesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _plantTypeInsertionAdapter = InsertionAdapter(
            database,
            'PlantType',
            (PlantType item) =>
                <String, Object?>{'id': item.id, 'title': item.title});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PlantType> _plantTypeInsertionAdapter;

  @override
  Future<List<PlantType>> getAllPlantsTypes() async {
    return _queryAdapter.queryList('SELECT * FROM PlantType',
        mapper: (Map<String, Object?> row) =>
            PlantType(id: row['id'] as int?, title: row['title'] as String));
  }

  @override
  Future<List<int>> insertAllPlantsTypes(List<PlantType> plantsTypes) {
    return _plantTypeInsertionAdapter.insertListAndReturnIds(
        plantsTypes, OnConflictStrategy.abort);
  }
}
