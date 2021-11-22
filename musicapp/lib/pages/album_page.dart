import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:musicapp/json/json.dart';
import 'package:musicapp/pages/music_detail_page.dart';
import 'package:musicapp/pages/request_song_page.dart';
import 'package:musicapp/theme/colors.dart';
import 'package:page_transition/page_transition.dart';

class AlbumPage extends StatefulWidget {
  final dynamic song;

  const AlbumPage({Key? key, this.song}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> with SingleTickerProviderStateMixin  {


  late AnimationController _controller;
  late Animation _listAnimation;

   @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _listAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.40, 0.75, curve: Curves.easeOut)));

    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List songAlbums = widget.song['songs'];
    
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Hero(
                tag: 'album',
                child: Container(
                  width: size.width,
                  height: 220,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.song['img']),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.song['title'],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                    GestureDetector(
                     onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  alignment: Alignment.bottomCenter,
                                  child: RequestSongPage(
                                    autor: widget.song['title'],
                                  ),
                                  type: PageTransitionType.scale));
                        },
                      child: Container(
                        decoration: BoxDecoration(
                            color: primary, borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          child: Text(
                            "Pedir una canción",
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  child: Text("Soy un apasionado por la música y este es mi contenido nacido en El Salvador, tengo 40 años con la mitad de mi vida en el munddo de la música", 
                  style: TextStyle(
                    fontSize: 15,
                    color: white.withOpacity(0.8)
                  ),),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 30),
              //     child: Row(
              //         children: List.generate(songs.length, (index) {
              //       return Padding(
              //         padding: const EdgeInsets.only(right: 30),
              //         child: GestureDetector(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 PageTransition(
              //                     alignment: Alignment.bottomCenter,
              //                     child: MusicDetailPage(
              //                       title: songs[index]['title'],
              //                       color: songs[index]['color'],
              //                       description: songs[index]['description'],
              //                       img: songs[index]['img'],
              //                       songUrl: songs[index]['song_url'],
              //                     ),
              //                     type: PageTransitionType.scale));
              //           },
              //           child: Column(
              //             children: [
              //               Container(
              //                 width: 180,
              //                 height: 180,
              //                 decoration: BoxDecoration(
              //                     image: DecorationImage(
              //                         image: AssetImage(songs[index]['img']),
              //                         fit: BoxFit.cover),
              //                     color: primary,
              //                     borderRadius: BorderRadius.circular(10)),
              //               ),
              //               SizedBox(
              //                 height: 20,
              //               ),
              //               Text(
              //                 songs[index]['title'],
              //                 style: TextStyle(
              //                     fontSize: 15,
              //                     color: white,
              //                     fontWeight: FontWeight.w600),
              //               ),
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               Container(
              //                 width: size.width - 210,
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       songs[index]['song_count'],
              //                       maxLines: 1,
              //                       textAlign: TextAlign.center,
              //                       style: TextStyle(
              //                           fontSize: 12,
              //                           color: grey,
              //                           fontWeight: FontWeight.w600),
              //                     ),
              //                     Text(
              //                       songs[index]['date'],
              //                       maxLines: 1,
              //                       textAlign: TextAlign.center,
              //                       style: TextStyle(
              //                           fontSize: 12,
              //                           color: grey,
              //                           fontWeight: FontWeight.w600),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     })),
              //   ),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              Opacity(
                opacity: _listAnimation.value,
                child: Column(
                  children: List.generate(
                    songAlbums.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: MusicDetailPage(
                                      title: songAlbums[index]['title'],
                                      color: songs[index]['color'],
                                      description: songs[index]['description'],
                                      img: songs[index]['img'],
                                      songUrl: songs[index]['song_url'],
                                    ),
                                    type: PageTransitionType.scale));
                          },
                          child: Row(
                            children: [
                              Container(
                                width:(size.width - 60)*0.15,
                                height: 50,
                                decoration: BoxDecoration(
                                  image:DecorationImage(
                                    image: AssetImage(
                                       songs[index]['img'],
                                    ),
                                    fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(90)
                                ),
                        
                              ),
                              SizedBox(width: (size.width - 60) * 0.05,),
                              Container(
                                width: (size.width - 60) * 0.55,
                                child: Text(
                                  songAlbums[index]['title'],
                                  style: TextStyle(color: white),
                                ),
                              ),
                              Container(
                                width: (size.width - 60) * 0.25,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      songAlbums[index]['duration'],
                                      style: TextStyle(
                                        color: grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: grey.withOpacity(0.8)),
                                      child: Center(
                                          child: Icon(
                                        Icons.play_arrow,
                                        color: white,
                                        size: 16,
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: Icon(
                    FeatherIcons.moreVertical,
                    color: white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RequestSong {
}
