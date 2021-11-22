import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:musicapp/theme/colors.dart';

class RequestSongPage extends StatefulWidget {
  final String autor;

  const RequestSongPage({Key? key, required this.autor}) : super(key: key);

  @override
  _RequestSongPageState createState() => _RequestSongPageState();
}

class _RequestSongPageState extends State<RequestSongPage> {
  double _border = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pedir una canción",
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
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.autor,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            AnimatedContainer(
                width: size.width - 40,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/request_song.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(_border)),
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Detalla la canción",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descripción de la canción',
                  hintText: 'Descripción',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Género",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Género',
                  hintText: 'Género',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_border == 20) {
                      _border = 90;
                    } else {
                      _border = 20;
                    }
                  });
                },
                child: Icon(Icons.shopping_bag),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
