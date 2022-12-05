import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:form_app/translations/locale_keys.g.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.news.tr(),
              textAlign: TextAlign.center),

          ),
    body: Container(
        color: Colors.white70,
        child: SingleChildScrollView(
            child:Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 35, right: 35),
                  child:
                  Image.asset('assets/images/image1.jpg'),

                ),
                SizedBox(
                  height: 10,
                ),
                Container(

                  margin: EdgeInsets.only( right: 50),
                  child:
                  Text.rich(
                    TextSpan(
                      text: LocaleKeys.Text1Bolt.tr(),
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: LocaleKeys.Text1.tr(),
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
                LikeButton(
                  mainAxisAlignment: MainAxisAlignment.start,
                  padding: EdgeInsets.only(top:10 ,left: 20),
                  size: 20,
                  circleColor: const CircleColor(
                      start: Colors.cyanAccent, end: Colors.cyan),
                  bubblesColor: const BubblesColor(
                      dotPrimaryColor: Colors.cyanAccent,
                      dotSecondaryColor: Colors.tealAccent),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 20,
                    );
                  },
                  likeCount: 93,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 35, right: 35),
                  child:
                  Image.network('assets/images/imagetrailer.jpg'),

                ),
                SizedBox(
                  height: 10,
                ),
                Container(

                  margin: EdgeInsets.only( right: 50),
                  child:
                  Text.rich(
                    TextSpan(
                      text: LocaleKeys.Text2Bolt.tr(),
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: LocaleKeys.Text2.tr(),
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
                LikeButton(
                  mainAxisAlignment: MainAxisAlignment.start,
                  padding: EdgeInsets.only(top:20 ,left: 20),
                  size: 20,
                  circleColor: const CircleColor(
                      start: Colors.cyanAccent, end: Colors.cyan),
                  bubblesColor: const BubblesColor(
                      dotPrimaryColor: Colors.cyanAccent,
                      dotSecondaryColor: Colors.tealAccent),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 20,
                    );
                  },
                  likeCount: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 35, right: 35),
                  child:
                  Image.network('assets/images/imageinternational.jpg'),

                ),
                SizedBox(
                  height: 10,
                ),
                Container(

                  margin: EdgeInsets.only( right: 50),
                  child:
                  Text.rich(
                    TextSpan(
                      text: LocaleKeys.Text3Bolt.tr(),
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: LocaleKeys.Text3.tr(),
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
                LikeButton(
                  mainAxisAlignment: MainAxisAlignment.start,
                  padding: EdgeInsets.only(top:20 ,left: 20),
                  size: 20,
                  circleColor: const CircleColor(
                      start: Colors.cyanAccent, end: Colors.cyan),
                  bubblesColor: const BubblesColor(
                      dotPrimaryColor: Colors.cyanAccent,
                      dotSecondaryColor: Colors.tealAccent),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 20,
                    );
                  },
                  likeCount: 170,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
        )


    ),
    ),
    );
  }
}