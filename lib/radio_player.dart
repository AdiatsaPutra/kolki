import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:kolki/radio_lsit.dart';
import 'package:kolki/radio_model.dart';

import 'package:kolki/shared/shared.dart';

class Player extends StatefulWidget {
  Channel channel;
  Player(this.channel);
  @override
  _PlayerState createState() => new _PlayerState();
}

class _PlayerState extends State<Player> with SingleTickerProviderStateMixin {
  String url;
  //Audio audio;

  @override
  initState() {
    super.initState();

    url = widget.channel.url;

    audioStart();
  }

  audioStart() async {
    if (await FlutterRadio.isPlaying()) {
      if (url != currentCh.url) {
        FlutterRadio.stop();
        FlutterRadio.play(url: url);
      } else {}
    } else {
      print("adsf");
      FlutterRadio.playOrPause(url: url);
    }
    playingStatus();
    currentCh = widget.channel;
    print('Audio Start OK');
  }

  Future playingStatus() async {
    //bool isP = await FlutterRadio.isPlaying();

    playerModel.update(true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new ScopedModel<PlayerModel>(
        model: playerModel,
        child: Scaffold(
          backgroundColor: mainColor, //Color.fromRGBO(40, 143, 235, 1),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ScopedModelDescendant<PlayerModel>(
                builder: (context, child, model) => new Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: "1234",
                    child: Image.asset(
                      model.isPlaying
                          ? "assets/hujan_ilmu.gif"
                          : "assets/kolki_logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Hero(
                  tag: "title",
                  child: Text(
                    widget.channel.title,
                    style: TextStyle(color: Colors.white),
                  )),
              new ScopedModelDescendant<PlayerModel>(
                builder: (context, child, model) => FloatingActionButton(
                    backgroundColor: accentColor1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        model.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                    onPressed: () async {
                      FlutterRadio.playOrPause(url: url);
                      // bool isP = await FlutterRadio.isPlaying();
                      model.update(null);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressed() {
    print("aff");
    FlutterRadio.playOrPause(url: url);
  }
}
