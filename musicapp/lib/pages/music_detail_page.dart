import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:musicapp/theme/colors.dart';

class MusicDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final Color color;
  final String img;
  final String songUrl;

  const MusicDetailPage(
      {Key? key,
      required this.title,
      required this.description,
      required this.color,
      required this.img,
      required this.songUrl})
      : super(key: key);

  @override
  _MusicDetailPageState createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                FeatherIcons.moreVertical,
                color: white,
              ))
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  width: size.width - 100,
                  height: size.width - 100,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: widget.color,
                        blurRadius: 50,
                        spreadRadius: 5,
                        offset: Offset(-10, 40))
                  ], borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Hero(
                  tag: 'album',
                  child: Container(
                    width: size.width - 60,
                    height: size.width - 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.img), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: size.width - 80,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(AntIcons.folderAddFilled, color: white),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 18,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            widget.description,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15, color: white.withOpacity(0.5)),
                          ),
                        )
                      ]),
                  Icon(FeatherIcons.moreVertical, color: white),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Slider(
              activeColor: primary,
              value: _currentSliderValue,
              min: 0,
              max: 200,
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
              }),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1:50",
                  style: TextStyle(color: white.withOpacity(0.5)),
                ),
                Text(
                  "4:50",
                  style: TextStyle(color: white.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    FeatherIcons.shuffle,
                    color: white.withOpacity(0.8),
                    size: 25,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    FeatherIcons.skipBack,
                    color: white.withOpacity(0.8),
                    size: 25,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  iconSize: 50,
                  icon: Container(
                    decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.stop,
                        size: 28,
                        color: white,
                      ),
                    ),
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    FeatherIcons.skipForward,
                    color: white.withOpacity(0.8),
                    size: 25,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    FeatherIcons.repeat,
                    color: white.withOpacity(0.8),
                    size: 25,
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FeatherIcons.tv,
                color: primary,
                size: 20,
              ),
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text("Chromecast is ready",
                style: TextStyle(
                  color: primary
                ),),
              )
            ],
          )
        ],
      ),
    );
  }
}
