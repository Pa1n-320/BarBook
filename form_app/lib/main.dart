import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_app/app/ui/pages/app_select_local.dart';
import 'package:form_app/auth/ui/pages/bottom_bar_page.dart';
import 'package:form_app/auth/ui/pages/login_page.dart';
import 'package:form_app/auth/ui/pages/register_form_page.dart';
import 'package:form_app/generated/codegen_loader.g.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


  runApp(
    EasyLocalization(

        supportedLocales: [Locale('kk'), Locale('ru'), Locale('en')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppSelectPage(),
      routes: { 'Next': (context) => RegisterFormPage(),
                'Submit': (context) => LoginFormPage(),
                'Enter': (context) => BottomBarPage()
      },

    );
  }
}