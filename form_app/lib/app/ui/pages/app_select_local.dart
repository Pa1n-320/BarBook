import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_app/translations/locale_keys.g.dart';

class AppSelectPage extends StatefulWidget {
  const AppSelectPage({Key? key}) : super(key: key);

  @override
  State<AppSelectPage> createState() => _AppSelectPageState();
}

class _AppSelectPageState extends State<AppSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(onPressed: (){Navigator.pushNamed(context,'Next'); }

              , child: Text("Next")),
          ElevatedButton(onPressed: () async{
            await context.setLocale(Locale('ru'));
          }, child: Text("RU")),
          ElevatedButton(onPressed: () async{
            await context.setLocale(Locale('en'));
          }, child: Text("EN")),
          ElevatedButton(onPressed: () async{
            await context.setLocale(Locale('kk'));
          }, child: Text("KZ")),
          Text(LocaleKeys.hello_text.tr()),

        ],
      ),
    );
  }
}