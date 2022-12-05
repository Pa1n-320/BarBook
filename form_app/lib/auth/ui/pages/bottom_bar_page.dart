import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_app/auth/ui/pages/fifthpage.dart';
import 'package:form_app/auth/ui/pages/mainpage.dart';
import 'package:form_app/auth/ui/pages/fourthpage.dart';
import 'package:form_app/auth/ui/pages/secondpage.dart';
import 'package:form_app/auth/ui/pages/thirdpage.dart';
import 'package:form_app/auth/ui/pages/user_info.dart';


class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int pageIndex = 0;
  final pages = [
    const MainPage(),
    const SecondPage(),
    const ThirdPage(),
    const FourthPage(),
    const ProfileInfoPage()


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Cybersport.ru",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.fiber_new,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.fiber_new,
              color: Colors.grey,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.add_a_photo,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.add_a_photo,
              color: Colors.grey,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.sentiment_satisfied
              ,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.sentiment_satisfied,
              color: Colors.grey,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
              Icons.map,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.map,
              color: Colors.grey,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 4;
              });
            },
            icon: pageIndex == 4
                ? const Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.person_outline,
              color: Colors.grey,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
