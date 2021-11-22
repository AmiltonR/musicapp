import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:musicapp/json/json.dart';
import 'package:musicapp/pages/album_page.dart';
import 'package:musicapp/theme/colors.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;
  int activeMenu1 = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explorar",
                style: TextStyle(),
              ),
              Icon(FeatherIcons.list)
            ],
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Row(
                  children: List.generate(song_type_1.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMenu = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song_type_1[index],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: activeMenu == index ? primary : grey,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            activeMenu == index
                                ? Container(
                                    width: 10,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.circular(5)))
                                : Container()
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                      children: List.generate(songs.length - 5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  alignment: Alignment.bottomCenter,
                                  child: AlbumPage(
                                    song: songs[index]
                                  ),
                                  type: PageTransitionType.scale));
                        },
                        child: Column(
                          children: [
                             Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(songs[index]['img']),
                                        fit: BoxFit.cover),
                                    color: primary,
                                    borderRadius: BorderRadius.circular(30)),//Circular o cuadrado
                              ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              songs[index]['title'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 180,
                              child: Text(
                                songs[index]['description'],
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Row(
                  children: List.generate(song_type_2.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMenu1 = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song_type_2[index],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: activeMenu1 == index ? primary : grey,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            activeMenu1 == index
                                ? Container(
                                    width: 10,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.circular(5)))
                                : Container()
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                    children: List.generate(songs.length - 5, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                alignment: Alignment.bottomCenter,
                                child: AlbumPage(
                                  song: songs[index + 5]
                                ),
                                type: PageTransitionType.scale));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(songs[index + 5]['img']),
                                    fit: BoxFit.cover),
                                color: primary,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            songs[index + 5]['title'],
                            style: TextStyle(
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 180,
                            child: Text(
                              songs[index + 5]['description'],
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: grey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
