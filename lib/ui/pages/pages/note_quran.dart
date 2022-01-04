part of 'pages.dart';

class WebViewEx extends StatefulWidget {
  const WebViewEx({Key key}) : super(key: key);

  @override
  _WebViewExState createState() => _WebViewExState();
}

class _WebViewExState extends State<WebViewEx> {
  //TextEditingController _controller;
  final List<String> _link = [
    'yufid.com',
    'rumaysho.com',
    'muslim.or.id',
    'pengusahamuslim.com',
    'almanhaj.co.id',
    'youtube.com',
    'rumaysho.com',
    'rumaysho.com',
    'rumaysho.com',
  ];
  final List<String> _nama = [
    'GOOGLE',
    'RUMAYSHO',
    'MUSLIM',
    'PENGUSAHA MUSLIM',
    'MANHAJ',
    'UHUY',
    'YUFID',
    'HSI',
    'FIRANDA',
  ];
  final List<String> _gambar = [
    'assets/ic_horror.png',
    'assets/ic_crime.png',
    'assets/ic_movie.png',
    'assets/ic_movie_grey.png',
    'assets/ic_tickets.png',
    'assets/ic_drama.png',
    'assets/ic_action.png',
    'assets/ic_war.png',
    'assets/ic_check.png',
  ];
  @override
  void initState() {
    super.initState();
    // this._controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    //  _controller.text = 'www.google.com';
    return GridView.builder(
        itemCount: _nama.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                this._openInWebview("https://www.${_link[index]}");
              },
              child: Column(children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(_gambar[index]),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: 5),
                Container(
                    height: 37,
                    width: 60,
                    child: Text(
                      _nama[index],
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ))
              ]));
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.75,
            crossAxisCount: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5));
  }

  Future<Null> _openInWebview(String url) async {
    if (await url_launcher.canLaunch(url)) {
      Navigator.of(this.context).push(
        MaterialPageRoute(
          builder: (ctx) => WebviewScaffold(
            initialChild: Center(child: CircularProgressIndicator()),
            url: url,
            appBar:
                AppBar(title: Text(url), backgroundColor: mainColor, actions: [
              IconButton(
                  icon: Icon(
                    Icons.wallet_giftcard_rounded,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        builder: (BuildContext context) {
                          return DraggableScrollableSheet(
                              expand: false,
                              initialChildSize: 1.0,
                              builder: (_, controller) => Container(
                                    height: 40,
                                    child: SingleChildScrollView(
                                      controller: controller,
                                      child: Container(
                                          height: 400,
                                          child: Container(height: 125)),
                                    ),
                                  ));
                        },
                        context: ctx);
                  })
            ]),
          ),
        ),
      );
    } else {
      Scaffold.of(this.context).showSnackBar(
        SnackBar(
          content: Text('URL $url can not be launched.'),
        ),
      );
    }
  }
}
