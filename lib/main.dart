import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:provider/provider.dart';
import 'package:vilcom_digital_restaurant/views/authentication/login.dart';

import 'config/theme.dart';
import 'custom_widgets/action_button.dart';
import 'custom_widgets/bordered_container.dart';
import 'custom_widgets/custom_text.dart';
import 'routes/routes_generator.dart';
import 'utils/constants/providers.dart';
import 'utils/helpers/check_device.dart';
import 'utils/interceptor/network_interceptor.dart';
import 'views/intro_pages/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await Hive.initFlutter();
  bool isDeviceSafe = await DeviceChecker.isSafeDevice();
  bool developerModeEnabled = await DeviceChecker.isDevelopmentModeEnable();
  if ((!isDeviceSafe || developerModeEnabled) && !kDebugMode) {
    runApp(
      MultiProvider(
        providers: getProviders(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Image.asset(
                  "assets/background_3x.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: CBCircle(
                      border: 24,
                      // theme: Theme.of(context).colorScheme.surfaceBright.withValues(alpha: .2),
                      shadow: true,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 8),
                            Image.asset("assets/logo.png", width: 60),
                            SizedBox(height: 12),
                            CText(
                              text: "Attention!".toUpperCase(),
                              // color: AppThemeColor.primaryColor,
                              size: 14,
                              fontWeight: FontWeight.w900,
                            ),
                            CText(
                              centered: true,
                              text:
                                  "This App can not run on rooted, Simulated device or developer mode.",
                              // color: AppThemeColor.black.withValues(alpha: .4),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ActionButton(
                                onTap: () => exit(0),
                                label: "Close & Exit",
                                // color: AppThemeColor.greenBrighter,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } else {
    runApp(MultiProvider(providers: getProviders(), child: const App()));
  }

  // runApp(
  //   MultiProvider(
  //     providers: getProviders(),
  //     child: const App(),
  //   ),
  // );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    checkForUpdate();
    super.initState();
  }

  void checkForUpdate() async {
    try {
      final updateInfo = await InAppUpdate.checkForUpdate();

      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          // ignore: body_might_complete_normally_catch_error
          InAppUpdate.performImmediateUpdate().catchError((e) {});
        } else if (updateInfo.flexibleUpdateAllowed) {
          InAppUpdate.startFlexibleUpdate()
              .then((_) {
                InAppUpdate.completeFlexibleUpdate();
              })
              .catchError((e) {});
        }
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    TextTheme txtTheme = const TextTheme();
    var theme = MaterialTheme(txtTheme).theme(MaterialTheme.lightScheme());
    // final translationProvider =
    //     Provider.of<TranslationProvider>(context, listen: false);
    return MaterialApp(
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) {
                // Ensure Overlay is available before initializing NetworkInterceptor
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  NetworkInterceptor().init(context);
                });
                return child ?? Container();
              },
            ),
          ],
        );
      },
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: theme,
      supportedLocales: const [Locale('en', 'UK'), Locale('sw', 'TZ')],
      // locale: Locale(translationProvider.currentLanguage),
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return const Locale('en', 'UK');
      },
      onGenerateRoute: (settings) {
        return RouteGenerator.generateRoute(settings);
      },
    );
  }
}
