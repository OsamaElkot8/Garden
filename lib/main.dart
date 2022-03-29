import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:garden/models/bloc/settings_bloc/settings_bloc.dart';
import 'package:garden/models/bloc/settings_bloc/settings_bloc_state.dart';
import 'package:garden/models/utilities/language/languages.dart';
import 'package:garden/models/utilities/localizations/locales_constants.dart';
import 'package:garden/models/utilities/localizations/localizations_delegate.dart';
import 'package:garden/models/utilities/themes/theme_dark.dart';
import 'package:garden/models/utilities/themes/theme_light.dart';
import 'package:garden/ui/screens/home_screen.dart';

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
        BlocProvider<SettingsBloc>(
          create: (ctx) => SettingsBloc(),
        )
      ],
      child: BlocBuilder<SettingsBloc, SettingsBlocState>(
          builder: (context, state) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Garden',
          themeMode: state.settings!.theme,
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
          locale: state.settings!.locale,
          initialRoute: HomeScreen.id,
          routes: {HomeScreen.id: (context) => const HomeScreen()},
        );
      }),
    );
  }
}
