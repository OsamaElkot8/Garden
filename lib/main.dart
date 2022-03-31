import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:garden/models/bloc/plants/plants_cubit.dart';
import 'package:garden/models/bloc/settings/settings_cubit.dart';
import 'package:garden/models/entities/settings/settings.dart';
import 'package:garden/models/utilities/language/languages.dart';
import 'package:garden/models/utilities/localizations/locales_constants.dart';
import 'package:garden/models/utilities/localizations/localizations_delegate.dart';
import 'package:garden/models/utilities/settings/settings_service.dart';
import 'package:garden/models/utilities/themes/theme_dark.dart';
import 'package:garden/models/utilities/themes/theme_light.dart';
import 'package:garden/ui/screens/home/home_screen.dart';
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
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          locale: _settings.locale,
          initialRoute: HomeScreen.id,
          routes: {
            HomeScreen.id: (context) => const HomeScreen(),
            PlantsScreen.id: (context) => const PlantsScreen()
          },
        );
      }),
    );
  }
}
