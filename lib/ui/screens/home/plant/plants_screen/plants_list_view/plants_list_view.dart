import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/main.dart';
import 'package:garden/models/bloc/plants/plants_cubit.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/plants_list_view/plant_view.dart';
import 'package:garden/ui/ui_helper.dart';

class PlantsListView extends StatelessWidget {
  PlantsListView({Key? key}) : super(key: key);

  final List<Plant> _plants = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlantsCubit, PlantsState>(
      listener: (context, state) {
        String? _snackBarMessage = state.when(
          idle: () => appLocalizations(context).loading,
          loading: () => appLocalizations(context).loading,
          loaded: (List<Plant> plants) {
            if (plants.isEmpty) {
              return appLocalizations(context).noMorePlants;
            }
            return null;
          },
          loadingError: (String reason) {
            PlantsCubit _plantsCubit = context.read<PlantsCubit>();
            _plantsCubit.isFetching = false;

            return appLocalizations(context).errorGettingPlants;
          },
        );

        if (_snackBarMessage != null) {
          UIHelper.instance
              .showSnackBarMessage(context, message: _snackBarMessage);
        }
      },
      builder: (context, state) {
        Widget? _view = state.when(
          idle: () {
            return const Center(child: CircularProgressIndicator());
          },
          loading: () {
            if (_plants.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            /* returning null means show last updated plants listview,
            so as the plants list isn't empty .. keep the list on the screen and load more
             */
            return null;
          },
          loaded: (List<Plant> plants) {
            // in case of items loaded
            PlantsCubit _plantsCubit = context.read<PlantsCubit>();
            _plantsCubit.isFetching = false;

            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            _plants.addAll(plants);
            /* returning null means show last updated plants listview */
            return null;
          },
          loadingError: (String reason) {
            if (_plants.isEmpty) {
              /* in case of error happened and the list is still empty, show refresh view,
           otherwise should show last updated plants listview */
              return Center(
                child: _fetchPlantsErrorView(context, error: reason),
              );
            }
            /* returning null means show last updated plants listview,
            so as the plants list isn't empty .. keep the list on the screen and load more
             */
            return null;
          },
        );

        /* returning _view can only be progress indicator or error view
           otherwise show plants listview
             */
        return _view ?? _plantsListView(context);
      },
    );
  }

  Widget _plantsListView(BuildContext context) {
    const EdgeInsets _listViewPadding = EdgeInsets.all(20.0);

    return ListView.separated(
      padding: _listViewPadding,
      controller: _scrollController
        ..addListener(() => _scrollControllerListener(context)),
      itemBuilder: (context, index) {
        final Plant _singlePlant = _plants[index];
        return PlantView(plant: _singlePlant);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: _plants.length,
    );
  }

  void _scrollControllerListener(BuildContext context) {
    PlantsCubit _plantsCubit = context.read<PlantsCubit>();

    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        !_plantsCubit.isFetching) {
      _fetchPlants(context);
    }
  }

  Widget _fetchPlantsErrorView(BuildContext context, {required String error}) {
    TextTheme _textTheme = UIHelper.instance.getTextTheme(context);
    ColorScheme _colorScheme = UIHelper.instance.getColorScheme(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => _fetchPlants(context),
          icon: Icon(
            Icons.refresh,
            color: _colorScheme.primary,
          ),
        ),
        const SizedBox(height: 15),
        Text(error,
            style: _textTheme.bodyText1!.copyWith(color: _colorScheme.error),
            textAlign: TextAlign.center),
      ],
    );
  }

  void _fetchPlants(BuildContext context) {
    PlantsCubit _plantsCubit = context.read<PlantsCubit>();
    _plantsCubit
      ..isFetching = true
      ..fetchPlants();
  }
}
