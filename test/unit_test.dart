import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden/models/bloc/plants/plants_cubit.dart';
import 'package:garden/models/bloc/settings/settings_cubit.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/models/entities/settings/settings.dart';
import 'package:garden/models/utilities/extensions/datetime_extension.dart';
import 'package:garden/models/utilities/settings/settings_service.dart';
import 'package:garden/repository/local/dao/plants/plants.dart';
import 'package:garden/repository/local/database/local_database.dart';
import 'package:garden/repository/local/local_constants.dart';

void main() {
  group('PlantsCubit Test', () {
    test('Test Database Connection, Clear All Plants', () async {
      final _database = await $FloorLocalDatabase
          .databaseBuilder(LocalConstants.databaseName)
          .build();
      final PlantsDao _plantsDao = _database.plantsDao;
      await _plantsDao.clearPlantsTable();
      List<Plant> _plants = await _plantsDao.getPlants(-1);
      expect(_plants, <Plant>[]);
    });

    late PlantsCubit _plantsCubit;
    setUp(() {
      _plantsCubit = PlantsCubit();
    });

    blocTest<PlantsCubit, PlantsState>(
      '"FetchPlants" : emits [FetchLoading, FetchLoaded] when nothing is added',
      build: () => _plantsCubit,
      act: (bloc) {
        return bloc.fetchPlants();
      },
      expect: () => [const FetchLoading(), const FetchLoaded(<Plant>[])],
    );

    blocTest<PlantsCubit, PlantsState>(
      '"AddPlants" : emits [ExistingAddAll] with correct plants',
      build: () => _plantsCubit,
      act: (bloc) {
        final DateTime _now = DateTime.now();
        final String _plantsADate =
            DateTime(_now.year, _now.month, _now.day).defaultFormat();

        final List<Plant> _plants = [
          Plant(name: 'A', type: 'alpines', date: _plantsADate),
        ];
        return bloc.fetchedPlantsAddAll(plants: _plants);
      },
      expect: () {
        final DateTime _now = DateTime.now();
        final String _plantsADate =
            DateTime(_now.year, _now.month, _now.day).defaultFormat();

        final List<Plant> _plants = [
          Plant(id: 1, name: 'A', type: 'alpines', date: _plantsADate),
        ];
        return [ExistingAddAll(_plants)];
      },
    );

    blocTest<PlantsCubit, PlantsState>(
      '"UpdatePlants" : emits [UpdateExisting] with correct plants',
      build: () => _plantsCubit,
      act: (bloc) async {
        final DateTime _now = DateTime.now();
        final String _plantsADate =
            DateTime(_now.year, _now.month, _now.day).defaultFormat();
        final Plant _a =
            Plant(id: 1, name: 'A', type: 'alpines', date: _plantsADate);

        _a.name = 'AA';

        final List<Plant> _plants = [_a];
        return bloc.fetchedPlantUpdateExisting(plants: _plants);
      },
      expect: () {
        final DateTime _now = DateTime.now();
        final String _plantsADate =
            DateTime(_now.year, _now.month, _now.day).defaultFormat();

        final Plant _a =
            Plant(id: 1, name: 'AA', type: 'alpines', date: _plantsADate);

        final List<Plant> _plants = [_a];
        return [UpdateExisting(_plants)];
      },
    );

    blocTest<PlantsCubit, PlantsState>(
      '"FetchPlants" : emits [FetchLoading, FetchLoaded] with one last updated plant',
      build: () => _plantsCubit,
      act: (bloc) => bloc.fetchPlants(),
      expect: () {
        final DateTime _now = DateTime.now();
        final String _plantsADate =
            DateTime(_now.year, _now.month, _now.day).defaultFormat();

        final Plant _a =
            Plant(id: 1, name: 'AA', type: 'alpines', date: _plantsADate);

        final List<Plant> _plants = [_a];
        return [const FetchLoading(), FetchLoaded(_plants)];
      },
    );

    blocTest<PlantsCubit, PlantsState>(
      '"SearchPlants" : emits [SearchLoading, SearchLoaded] with matched plant',
      build: () => _plantsCubit,
      act: (bloc) => bloc.searchPlants(name: 'AA'),
      expect: () {
        final DateTime _now = DateTime.now();
        final String _plantsADate =
            DateTime(_now.year, _now.month, _now.day).defaultFormat();

        final Plant _a =
            Plant(id: 1, name: 'AA', type: 'alpines', date: _plantsADate);

        final List<Plant> _plants = [_a];
        return [const SearchLoading(), SearchLoaded(_plants)];
      },
    );

    tearDown(() {
      _plantsCubit.close();
    });
  });

  group('SettingsCubit Test', () {
    late SettingsCubit _settingsCubit;
    setUp(() {
      _settingsCubit = SettingsCubit();
    });

    blocTest<SettingsCubit, SettingsState>(
      '"fetchSettings" : emits [Loading, Loaded] with last updated settings',
      build: () => _settingsCubit,
      act: (bloc) {
        return bloc.fetchSettings();
      },
      expect: () {
        Settings _settings = SettingsService.instance.defaultSettings();
        return [const Loading(), Loaded(_settings)];
      },
    );

    tearDown(() {
      _settingsCubit.close();
    });
  });
}
