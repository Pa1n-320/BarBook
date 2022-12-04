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
      child: Container(
          padding: EdgeInsets.all(150),
          margin:  EdgeInsets.all(100),
          height: 400,
          width: 400,
          color: Color.fromRGBO(63,136,151,1),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'Next');
                },
                child: Text  (LocaleKeys.register.tr()),
                ),
                ElevatedButton(

                  onPressed: () {
                    Navigator.pushNamed(context, 'Submit');
                  },
                  child:
                  Text  (LocaleKeys.log_in.tr()),

                ),
                OutlinedButton(
                    onPressed: () async {
                      await context.setLocale(Locale('ru'));
                          },
                            child: Text("RU",
                                style: TextStyle(color: Colors.white))),
                SizedBox(height: 10),
                OutlinedButton(
                    onPressed: () async {
                      await context.setLocale(Locale('en'));
                    },
                    child: Text("EN",
                        style: TextStyle(color: Colors.white))),
                SizedBox(height: 10),
                OutlinedButton(
                    onPressed: () async {
                      await context.setLocale(Locale('kk'));
                    },
                    child: Text("KZ",
                        style: TextStyle(color: Colors.white))),
                //Text(LocaleKeys.hello_text.tr()),
                Text(LocaleKeys.hello_text.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,
                    decoration: TextDecoration.none))

              ]
          )
      ),
    );
  }
}