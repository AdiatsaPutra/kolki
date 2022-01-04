import 'package:flutter/material.dart';
import 'package:kolki/radio_player.dart';
import 'package:kolki/radio_lsit.dart';
import 'package:kolki/radio_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:kolki/shared/shared.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List list;
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    list = getChannels();

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModel<PlayerModel>(
      model: playerModel,
      child: Scaffold(
        body: list == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => Player(list[index])));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: defaultMargin,
                      ),
                      Card(
                        elevation: 3.0,
                        //shape: ShapeBorder.lerp(1,2,3),
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 150,
                                width: 150,
                                child: Image.network(
                                  list[index].imgurl,
                                  fit: BoxFit.fill,
                                )),
                            Text(list[index].title)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        bottomSheet: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => Player(currentCh)));
          },
          child: SizedBox(
            height: 60,
            child: Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(40, 143, 235, 1),
                  border: Border.all(
                    color: Color.fromRGBO(40, 143, 235, 1),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),

              //color: Color.fromRGBO(40, 143, 235, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ScopedModelDescendant<PlayerModel>(
                    builder: (context, child, model) => Hero(
                        tag: "1234",
                        child: Image.asset(model.isPlaying
                            ? "assets/hujan_ilmu.gif"
                            : "assets/kolki_logo.png")),
                  ),
                  Hero(
                      tag: "title",
                      child: Text(
                        currentCh.title,
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
