import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/models/bloc/plants/plants_cubit.dart';
import 'package:garden/models/bloc/settings/settings_cubit.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/models/entities/settings/settings.dart';
import 'package:garden/models/utilities/language/languages.dart';
import 'package:garden/models/utilities/localizations/locales_constants.dart';
import 'package:garden/models/utilities/settings/settings_service.dart';
import 'package:garden/models/utilities/themes/theme_dark.dart';
import 'package:garden/models/utilities/themes/theme_light.dart';
import 'package:garden/ui/screens/home/home_screen.dart';
import 'package:garden/ui/screens/home/plant/plant_manager/plant_manager_screen.dart';
import 'package:garden/ui/screens/home/plant/plant_manager/plant_manager_screen_arguments_enum.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/plants_screen.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "Main Navigator");

Languages appLocalizations(context) => Localizations.of(context, Languages);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('-------------- MyApp');
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (ctx) => SettingsCubit(),
        ),
        BlocProvider<PlantsCubit>(
          create: (ctx) => PlantsCubit(),
        )
      ],
      child:
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
        Settings _settings = state.maybeWhen(
            loaded: (Settings settings) => settings,
            orElse: () => SettingsService.instance.defaultSettings());

        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Garden',
          themeMode: _settings.theme,
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          darkTheme: darkTheme,
          supportedLocales: LocalesConstants.supportedLocales,
          localizationsDelegates: LocalesConstants.localizationsDelegates,
          localeResolutionCallback: LocalesConstants.localeResolutionCallback,
          locale: _settings.locale,
          initialRoute: HomeScreen.id,
          routes: {
            HomeScreen.id: (context) => const HomeScreen(),
            PlantsScreen.id: (context) => PlantsScreen()
          },
          onGenerateRoute: _getRoute,
        );
      }),
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name == PlantManagerScreen.id) {
      Map<PlantManagerScreenArgument, dynamic> _arguments =
          settings.arguments as Map<PlantManagerScreenArgument, dynamic>;
      return _buildRoute(
          settings,
          PlantManagerScreen(
            screenTitle:
                _arguments[PlantManagerScreenArgument.screenTitle] as String,
            onSaved: _arguments[PlantManagerScreenArgument.onSaved]
                as void Function(
                    {required String name,
                    required String type,
                    required String date}),
            plant: _arguments[PlantManagerScreenArgument.plant] as Plant?,
          ));
    }

    return null;
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}
