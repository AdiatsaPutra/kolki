part of 'pages.dart';

class Playlist extends StatefulWidget {
  final String title;
  final String url;

  Playlist({this.title, this.url});
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  Future<List> getData() async {
    final response = await http.get(widget.url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: mainColor,
        ),
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListVideo(list: snapshot.data)
                : SpinKitFadingCircle(
                    color: accentColor2,
                    size: 50,
                  );
          },
        ));
  }
}

class ListVideo extends StatelessWidget {
  List list;
  ListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (_, __, ___) => VideoPlay(
                    url:
                        'https://youtube.com/embed/${list[i]['contentDetails']['videoId']}')));
          },
          onLongPress: () {
            showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: false,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                context: context,
                builder: (BuildContext context) {
                  return DraggableScrollableSheet(
                      initialChildSize: 0.4,
                      builder: (_, controller) => Container(
                            color: Colors.white,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(defaultMargin,
                                  defaultMargin, defaultMargin, 0),
                              child: ListView(
                                controller: controller,
                                children: [
                                  Text(
                                    "Deskripsi",
                                    textAlign: TextAlign.left,
                                    style: blackTextFont.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: defaultMargin,
                                  ),
                                  Container(
                                    height: 500,
                                    child: Text(
                                      list[i]['snippet']['description'],
                                      maxLines: 4,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                });
          },
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: accentColor1),
                      image: DecorationImage(
                          image: NetworkImage(
                              list[i]['snippet']['thumbnails']['high']['url']),
                          fit: BoxFit.cover))),
              Container(
                  padding: const EdgeInsets.only(
                      left: defaultMargin, right: defaultMargin),
                  child: Text(
                    list[i]['snippet']['title'],
                    style: blackTextFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              Container(
                  padding: const EdgeInsets.only(
                      left: defaultMargin, right: defaultMargin),
                  child: Text(
                    list[i]['snippet']['videoOwnerChannelTitle'],
                    style: greyTextFont.copyWith(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: const EdgeInsets.only(
                    left: defaultMargin, right: defaultMargin),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "dibuat pada ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        list[i]['contentDetails']['videoPublishedAt'],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ]),
              ),
              SizedBox(height: 2.5 * defaultMargin),
            ],
          )),
        );
      },
    );
  }
}

/*
                Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (_, __, ___) => CalendarPage2()));
              },*/
class VideoPlay extends StatelessWidget {
  final String url;

  const VideoPlay({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PIPView(
        avoidKeyboard: false,
        initialCorner: PIPViewCorner.bottomRight,
        builder: (context, isFloating) {
          return Center(
            child: WebviewScaffold(
              resizeToAvoidBottomInset: true,
              scrollBar: true,
              initialChild: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
              appBar: AppBar(backgroundColor: mainColor, actions: [
                /*IconButton(
                    icon: Icon(Icons.picture_in_picture, color: Colors.black),
                    onPressed: () {
                      PIPView.of(context).presentBelow(MainPage());
                    }),*/
                IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          context: context,
                          builder: (BuildContext context) {
                            return Column(children: [
                              Container(
                                height: 280,
                                color: mainColor,
                              ),
                              Stack(children: [
                                Container(
                                    height: MediaQuery.of(context).size.height -
                                        280,
                                    child: MyNote()),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                        child: IconButton(
                                            icon: Icon(Icons.close),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            })))
                              ])
                            ]);
                          });
                    })
              ]),
              url: url,
            ),
          );
        });
  }
}
