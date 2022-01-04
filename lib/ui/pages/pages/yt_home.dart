part of 'pages.dart';

/*class HomePlaylist extends StatelessWidget {
  final url;

  const HomePlaylist({Key key, this.url}) : super(key: key);

  Future<List> getData() async {
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? CoverVideo(list: snapshot.data)
            : SpinKitFadingCircle(
                color: accentColor2,
                size: 50,
              );
      },
    );
  }
}*/

/*ListTile(
      title: Text("playlist"),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Playlist(
                  url: "https://kolki.herokuapp.com/", title: "flutter"),
            ));
      },
    );*/

/*part of 'pages.dart';

class HomePlaylist extends StatelessWidget {

  final List<String> url = [
    "https://kolki.herokuapp.com/",
  ];
  Future<List> getData() async {
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? CoverVideo(list: snapshot.data)
            : SpinKitFadingCircle(
                color: accentColor2,
                size: 50,
              );
      },
    );
    /*ListTile(
      title: Text("playlist"),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Playlist(
                  url: "https://kolki.herokuapp.com/", title: "flutter"),
            ));
      },
    );*/
  }
}

class CoverVideo extends StatelessWidget {
   final List<String> _url = [
    "https://kolki.herokuapp.com/",
    
    "https://kolki.herokuapp.com/",
    "https://kolki.herokuapp.com/",
  ];
  List list;
  CoverVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _url.length, //list == null ? 0 : list.length,
      itemBuilder: (ctx, i) {
        return ListTumbnail(url:url[i]);
      });
  }
}

class ListTumbnail extends StatelessWidget {
  ListTumbnail({this.title, this.url, this.list});
  final String title;
  final String url;
  List list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 1, //list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Playlist(url: url, title: title),
                  ));
            },
            onLongPress: () {},
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 178,
                      height: 98.0,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: accentColor1),
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(list[0]['snippet']
                                  ['thumbnails']['high']['url']),
                              fit: BoxFit.cover))),
                  Container(
                    width: 160,
                    child: Text(list[0]['snippet']['channelTitle'],
                        maxLines: 2,
                        style: blackTextFont.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w300)),
                  ),
                ]));
      },
    );
  }
}
*/
