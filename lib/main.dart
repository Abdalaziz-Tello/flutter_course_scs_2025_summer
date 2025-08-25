import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:service_solution/resource/app_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translate', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppString().title)),
      floatingActionButton: FloatingActionButton(
        child: Text(AppString().title),
        onPressed: () {
          if (context.locale.languageCode == 'en') {
            context.setLocale(Locale('ar'));
          } else {
            context.setLocale(Locale('en'));
          }
        },
      ),
      body: Center(child: Text(AppString().docs, style: TextStyle(fontSize: 35))),
    );
  }
}
