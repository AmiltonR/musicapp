import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:musicapp/theme/colors.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        Center(
          child: Text("Librería", style: TextStyle(
            fontSize: 20,
            color: white,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Buscar", style: TextStyle(
            fontSize: 20,
            color: white,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Configuración", style: TextStyle(
            fontSize: 20,
            color: white,
            fontWeight: FontWeight.bold
          ),),
        )
      ],
    );
  }

  Widget getFooter() {
    List items = [
      FeatherIcons.home,
      FeatherIcons.book,
      FeatherIcons.search,
      FeatherIcons.settings

    ];

    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: black,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
                icon: Icon(
                  items[index],
                  color: activeTab == index ? primary : white,
                ),
                onPressed: (){
                  setState(() {
                    activeTab = index;
                  });
                },);
          }),
        ),
      ),
    );
  }
}
