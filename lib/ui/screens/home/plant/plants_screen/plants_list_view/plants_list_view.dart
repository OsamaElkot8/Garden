import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/main.dart';
import 'package:garden/models/bloc/plants_bloc/plants_bloc.dart';
import 'package:garden/models/bloc/plants_bloc/plants_bloc_event.dart';
import 'package:garden/models/bloc/plants_bloc/plants_bloc_state.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/plants_list_view/plant_view.dart';
import 'package:garden/ui/ui_helper.dart';

class PlantsListView extends StatelessWidget {
  PlantsListView({Key? key}) : super(key: key);

  final List<Plant> _plants = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlantsBloc, PlantsBlocState>(
      listener: (context, state) {
        // using BlocConsumer listener to show snack bar message
        String? _snackBarMessage;
        switch (state.runtimeType) {
          case PlantsIdle:
          case PlantsLoading:
            _snackBarMessage = appLocalizations(context).loading;
            break;
          case PlantsLoaded:
            final casted = state as PlantsLoaded;
            final List<Plant> _plantsPerPage = casted.plants;
            if (_plantsPerPage.isEmpty) {
              _snackBarMessage = appLocalizations(context).noMorePlants;
            }
            break;
          case PlantsLoadingError:
          default:
            _snackBarMessage = appLocalizations(context).errorGettingPlants;
            PlantsBloc _plantsBloc = context.read<PlantsBloc>();
            _plantsBloc.isFetching = false;
            break;
        }

        if (_snackBarMessage != null) {
          UIHelper.instance
              .showSnackBarMessage(context, message: _snackBarMessage);
        }
      },
      builder: (context, state) {
        // build views according to Plants current state
        final bool _isLoading =
            state is PlantsIdle || (state is PlantsLoading && _plants.isEmpty);
        if (_isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PlantsLoaded) {
          // in case of items loaded
          PlantsBloc _plantsBloc = context.read<PlantsBloc>();
          _plantsBloc.isFetching = false;

          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          final List<Plant> _plantsPerPage = state.plants;
          _plants.addAll(_plantsPerPage);
        } else if (state is PlantsLoadingError && _plants.isEmpty) {
          /* in case of error happened and the list is still empty, show refresh view,
           otherwise should show last updated plants listview */
          return Center(
            child: _fetchPlantsErrorView(context, error: state.reason!),
          );
        }

        return _plantsListView(context);
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
    PlantsBloc _plantsBloc = context.read<PlantsBloc>();

    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        !_plantsBloc.isFetching) {
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
    PlantsBloc _plantsBloc = context.read<PlantsBloc>();
    _plantsBloc
      ..isFetching = true
      ..add(PlantsFetch());
  }
}
