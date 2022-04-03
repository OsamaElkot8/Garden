import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/main.dart';
import 'package:garden/models/bloc/plants/plants_cubit.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/ui/components/refetch_view.dart';
import 'package:garden/ui/screens/home/plant/plant_manager/plant_manager_screen.dart';
import 'package:garden/ui/screens/home/plant/plant_manager/plant_manager_screen_arguments_enum.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/appBar_bottom_search_field.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/plants_list_view/plants_list_view.dart';
import 'package:garden/ui/ui_constants.dart';
import 'package:garden/ui/ui_helper.dart';

class PlantsScreen extends StatefulWidget {
  static const String id = 'plantsScreen';
  const PlantsScreen({Key? key}) : super(key: key);

  @override
  State<PlantsScreen> createState() => _PlantsScreenState();
}

class _PlantsScreenState extends State<PlantsScreen> {
  final List<Plant> _plants = [];

  // _scrollController only used in case of paginating default plants list (not in searching)
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _fetchPlants();
    super.initState();
  }

  TextTheme get _textTheme => UIHelper.instance.getTextTheme(context);
  ColorScheme get _colorScheme => UIHelper.instance.getColorScheme(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations(context).garden),
        bottom: const AppBarBottomSearchField(),
      ),
      body: SafeArea(
        child: BlocConsumer<PlantsCubit, PlantsState>(
          listener: (context, state) {
            String? _snackBarMessage = state.when(
              idle: () => null,
              fetchLoading: () => appLocalizations(context).loading,
              fetchLoaded: (List<Plant> plants) {
                // in case of items loaded
                ScaffoldMessenger.of(context).hideCurrentSnackBar();

                PlantsCubit _plantsCubit = context.read<PlantsCubit>();
                _plantsCubit.isFetching = false;

                if (plants.isEmpty) {
                  return appLocalizations(context).noMorePlants;
                }
                return null;
              },
              fetchLoadingError: (String reason) {
                PlantsCubit _plantsCubit = context.read<PlantsCubit>();
                _plantsCubit.isFetching = false;

                return appLocalizations(context).errorGettingPlants;
              },
              searchLoading: () => null,
              searchLoaded: (List<Plant> plants) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                return null;
              },
              searchLoadingError: (String reason) =>
                  appLocalizations(context).errorGettingPlants,
              existingAddAll: (List<Plant> plants) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                return appLocalizations(context).plantAdded;
              },
              existingAddAllError: (String reason) =>
                  appLocalizations(context).errorAddingPlant,
              updateExisting: (List<Plant> updatedPlants) {
                String _snackBarText =
                    appLocalizations(context).plant + UiConstants.stringSpace;
                for (var plant in updatedPlants) {
                  _snackBarText += plant.name + UiConstants.stringSpace;
                }
                _snackBarText += appLocalizations(context).updated;
                return _snackBarText;
              },
              updateExistingError: (String reason) =>
                  appLocalizations(context).errorUpdating +
                  appLocalizations(context).plant,
            );

            if (_snackBarMessage != null) {
              UIHelper.instance
                  .showSnackBarMessage(context, message: _snackBarMessage);
            }
          },
          builder: (context, state) {
            Widget? _view = state.when(
                idle: () => const Center(child: CircularProgressIndicator()),
                fetchLoading: () {
                  if (_plants.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  /* returning null means show last updated plants listview,
            so as the plants list isn't empty .. keep the list on the screen and load more
             */
                  return null;
                },
                fetchLoaded: (List<Plant> plants) {
                  return _onAddingPlants(plants: plants);
                },
                fetchLoadingError: (String reason) =>
                    _onAddingPlantsError(reason: reason),
                searchLoading: () =>
                    const Center(child: CircularProgressIndicator()),
                searchLoaded: (List<Plant> plants) {
                  if (plants.isEmpty) {
                    return Center(
                      child: Text(
                          appLocalizations(context)
                              .sorryWeCouldNotFindAnyResult,
                          style: _textTheme.bodyText1!,
                          textAlign: TextAlign.center),
                    );
                  }

                  return PlantsListView(plants: plants);
                },
                searchLoadingError: (String reason) => Center(
                      child: Text(reason,
                          style: _textTheme.bodyText1!
                              .copyWith(color: _colorScheme.error),
                          textAlign: TextAlign.center),
                    ),
                existingAddAll: (List<Plant> plants) =>
                    _onAddingPlants(plants: plants),
                existingAddAllError: (String reason) =>
                    _onAddingPlantsError(reason: reason),
                updateExisting: (List<Plant> updatedPlants) {
                  for (var updatedPlant in updatedPlants) {
                    int _plantIndex = _plants.indexWhere(
                        (existingPlant) => existingPlant.id == updatedPlant.id);
                    if (_plantIndex != -1) {
                      // in case plant matched
                      _plants[_plantIndex] = updatedPlant;
                    }
                  }
                  return null;
                },
                updateExistingError: (String reason) => null);

            /* returning _view can only be progress indicator or error view
           otherwise show plants listview
             */
            return _view ??
                PlantsListView(
                    controller: _scrollController
                      ..addListener(() => _scrollListener()),
                    plants: _plants);
          },
        ),
      ),
      floatingActionButton: _addPlantFloatingActionButton(context),
    );
  }

  void _scrollListener() {
    PlantsCubit _plantsCubit = context.read<PlantsCubit>();

    /* on reaching bottom of list fetch more plants as this scroll controller
   only used in case of paginating default plants list (not in searching)
    */
    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        !_plantsCubit.isFetching) {
      _fetchPlants();
    }
  }

  Widget? _onAddingPlants({required List<Plant> plants}) {
    _plants.addAll(plants);

    if (_plants.isEmpty) {
      return Center(
        child: Text(appLocalizations(context).yourPlantsListCurrentlyEmpty,
            style: _textTheme.bodyText1!, textAlign: TextAlign.center),
      );
    }

    /* returning null means show last updated plants listview */
    return null;
  }

  Widget? _onAddingPlantsError({required String reason}) {
    if (_plants.isEmpty) {
      /* in case of error happened and the list is still empty, show refresh view,
                  otherwise should show last updated plants listview */
      return Center(
        child:
            ReFetchView(error: reason, refreshOnPressed: () => _fetchPlants()),
      );
    }
    /* returning null means show last updated plants listview,
                so as the plants list isn't empty .. keep the list on the screen and load more
             */
    return null;
  }

  Widget _addPlantFloatingActionButton(BuildContext context) =>
      FloatingActionButton.extended(
        onPressed: () => _addPlantButtonOnPressed(context),
        label: Text(appLocalizations(context).addPlant),
        icon: const Icon(Icons.add),
      );

  void _addPlantButtonOnPressed(BuildContext context) {
    Navigator.pushNamed(context, PlantManagerScreen.id, arguments: {
      PlantManagerScreenArgument.screenTitle:
          appLocalizations(context).addPlant,
      PlantManagerScreenArgument.onSaved: (
          {required String name,
          required String type,
          required String date}) async {
        Plant _plant = Plant(name: name, type: type, date: date);
        _fetchedPlantsAddAll(plants: <Plant>[_plant]);
      }
    });
  }

  void _fetchedPlantsAddAll({required List<Plant> plants}) {
    PlantsCubit _plantsCubit = context.read<PlantsCubit>();
    _plantsCubit.fetchedPlantsAddAll(plants: plants);
  }

  void _fetchPlants() {
    PlantsCubit _plantsCubit = context.read<PlantsCubit>();

    int _lastPlantRecordId = -1;
    if (_plants.isNotEmpty) {
      _lastPlantRecordId = _plants.last.id!;
    }

    _plantsCubit
      ..isFetching = true
      ..fetchPlants(lastPlantRecordId: _lastPlantRecordId);
  }
}
