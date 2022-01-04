part of 'pages.dart';

class SumberIlmu extends StatefulWidget {
  Channel channel;
  SumberIlmu({Key key, this.channel}) : super(key: key);

  @override
  _SumberIlmuState createState() => _SumberIlmuState();
}

class _SumberIlmuState extends State<SumberIlmu> {
  final List<String> _ids = [
    'GQil-ZKilIY',
    '83YUZSXf7fA',
    'JD4k7WyMUQQ',
    'KvPs60lTjio',
    'zkDy7hNjgw4',
    '9WouyxEiLyQ',
    'bFUhfGI3SQg',
    'czdN5o6KSlQ',
    'FH3WGe-gqps',
  ];

  final List<String> _link = [
    'https://www.yufid.com',
    'https://www.rumaysho.com',
    'https://www.muslim.or.id',
    'https://www.pengusahamuslim.com',
    'https://www.almanhaj.co.id',
    'https://www.youtube.com',
    'https://www.rumaysho.com',
    'https://www.rumaysho.com',
    'https://www.rumaysho.com',
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
  final FirebaseServices _firebaseServices = FirebaseServices();

  final CollectionReference _tvRef =
      FirebaseFirestore.instance.collection("Tv");

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(
          height: 200,
          width: double.infinity,
          child: Carousel(
              radius: Radius.circular(8),
              dotSize: 4,
              dotSpacing: 15,
              indicatorBgPadding: 5,
              dotBgColor: Colors.transparent,
              dotVerticalPadding: 5,
              dotPosition: DotPosition.bottomRight,
              images: [
                Image.asset("assets/a1.jpeg", fit: BoxFit.cover),
                Image.asset("assets/a2.jpeg", fit: BoxFit.cover),
                Image.asset("assets/a3.jpeg", fit: BoxFit.cover)
              ])),
      /* SizedBox(height: defaultMargin),
      Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 12),
        child: Text(
          "Dengan apa aku mensyukuri Mataku ini?",
          style:
              blackTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
          height: 180,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              itemCount: _nama.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      this._openInWebview(_link[index]);
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
                  crossAxisSpacing: 5))),*/
      Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 12),
        child: Text(
          "Apa yang sering aku dengarkan melalui Telingaku ini?",
          style:
              blackTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Container(height: 250, child: Home()),
      Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 12),
        child: Text(
          "Bisakah aku sisihkan 1/24 jam ku dengan ini?",
          style:
              blackTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      /*Container(
          // color: Colors.pink,
          height: 240,
          width: 360,
          child: Stack(children: [
            FutureBuilder<QuerySnapshot>(
              future: _tvRef.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }

                // Collection Data ready to display
                if (snapshot.connectionState == ConnectionState.done) {
                  // Display the data inside a list view
                  return Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: snapshot.data.docs.map((document) {
                      return FutureBuilder(
                        future: _tvRef.get(),
                        builder: (context, productSnap) {
                          if (productSnap.hasError) {
                            return Container(
                              child: Center(
                                child: Text("${productSnap.error}"),
                              ),
                            );
                          }

                          if (productSnap.connectionState ==
                              ConnectionState.done) {
                            Map _productMap = productSnap.data.data();
                            Map<String, dynamic> documentData =
                                productSnap.data.data();
                            return Row(children: [
                              for (var i = 0;
                                  i < documentData["link"].length;
                                  i++)
                                SingleVideo("${documentData["link"][i]}")
                            ]);
                          }

                          return Container(
                            child: Center(
                                // child: CircularProgressIndicator(),
                                ),
                          );
                        },
                      );
                    }).toList(),
                  );
                }

                // Loading State
                return Scaffold(
                  body: Center(
                      child: SpinKitFadingCircle(
                    color: accentColor2,
                    size: 50,
                  )),
                );
              },
            )
          ])),*/
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            SingleVideo(_ids[0]),
            SingleVideo(_ids[1]),
            SingleVideo(_ids[2]),
            SingleVideo(_ids[3]),
            SingleVideo(_ids[4]),
            SingleVideo(_ids[5]),
            SingleVideo(_ids[6]),
            SingleVideo(_ids[7]),
            SingleVideo(_ids[8]),
          ])),
      Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 12),
        child: Text(
          "Mana Rezekiku yang sebenarnya?",
          style:
              blackTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 12),
          height: 180,
          width: MediaQuery.of(context).size.width,
          child: WebViewEx()),
      SizedBox(height: 2 * defaultMargin),
    ]);
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
