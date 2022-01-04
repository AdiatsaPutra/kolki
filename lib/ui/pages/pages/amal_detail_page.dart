part of 'pages.dart';

class AmalDetailPage extends StatefulWidget {
  final String productId;

  const AmalDetailPage({
    Key key,
    this.productId,
  }) : super(key: key);
  @override
  _AmalDetailPageState createState() => _AmalDetailPageState();
}

class _AmalDetailPageState extends State<AmalDetailPage> {
  /*String colorButton = "Mulai merutinkan";
  String videoID = "5qap5aO4i9A";
  List<Map<String, dynamic>> players = [
    {"videoID": "PFO-ZSofj2c", "quality": ThumbnailQuality.max},
    {"videoID": "EgMi4aH4il4", "quality": ThumbnailQuality.max},
    {"videoID": "bhu0x4hoddA", "quality": ThumbnailQuality.max}
  ];*/
  Future _addToCart() {
    return _firebaseServices.usersCollection
        .doc(_firebaseServices.getUserId())
        .collection("Cart")
        .doc(widget.productId)
        .set({"materi": _selectedMateri});
  }

  PageController _pageController = new PageController();
  //int _selectedPage = 0;
  FirebaseServices _firebaseServices = FirebaseServices();
  final CollectionReference _hatiRef =
      FirebaseFirestore.instance.collection("Hati");
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("users");
  // User _user =auth.FirebaseAuth.instance.currentUser;

  final SnackBar _snackBar = SnackBar(
    content: Text("Product added to the cart"),
  );
  List<Key> keys = [
    Key("Network"),
    Key("NetworkDialog"),
    Key("Flare"),
    Key("FlareDialog"),
    Key("Asset"),
    Key("AssetDialog")
  ];
  int followerCount = 0;
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    getFollowers();
    checkIfFollowing();
  }

  getFollowers() async {
    QuerySnapshot snapshot = await _firebaseServices.hatiRef
        .doc(widget.productId)
        .collection("member")
        .getDocuments();
    setState(() {
      followerCount = snapshot.size;
    });
  }

  checkIfFollowing() async {
    DocumentSnapshot docshot = await _firebaseServices.hatiRef
        .doc(widget.productId)
        .collection("member")
        .doc(_firebaseServices.getUserId())
        .get();
    setState(() {
      isFollowing = docshot.exists;
    });
  }

  Future _addToMember() async {
    return _firebaseServices.hatiRef
        .doc(widget.productId)
        .collection("member")
        .doc(_firebaseServices.getUserId())
        .set({"materi": _selectedMateri});
  }

  final _screenshotController = ScreenshotController();
  void _takeScreenshot() async {
    final imageFile = await _screenshotController.capture();
    Share.shareFiles([imageFile.path],
        text:
            "Assalaamu'alaykum, yuk kawan mari rutinkan ibadah ini, temukan  di aplikasi kolki");
  }

  String _selectedMateri = "0";
  @override
  Widget build(BuildContext context) {
    //bool _colorButton = colorButton ?? false;
    return SafeArea(
        top: false,
        child: Screenshot(
            controller: _screenshotController,
            child: Container(
              color: Colors.white,
              child: Scaffold(
                body: Stack(children: [
                  FutureBuilder<DocumentSnapshot>(
                      future: _hatiRef.doc(widget.productId).get(), //widget.dd,
                      //yang mau di isi pake second
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Scaffold(
                            body: Center(
                              child: Text("error${snapshot.error}"),
                            ),
                          );
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          //fb data map
                          Map<String, dynamic> documentData =
                              snapshot.data.data();
                          //list of images
                          List imageList = documentData["gambar"];

                          List promateri = documentData['materi'];

                          //List urlList = documentData['link'];
                          _selectedMateri = promateri[0];

                          return CustomScrollView(slivers: [
                            SliverAppBar(
                              actions: [
                                IconButton(
                                    icon: Icon(Icons.share),
                                    onPressed: _takeScreenshot),
                              ],
                              elevation: 0,
                              backgroundColor: mainColor,
                              floating: true,
                              expandedHeight: 320,
                              pinned: true,
                              flexibleSpace: FlexibleSpaceBar(
                                title: Container(
                                  padding: EdgeInsets.only(right: 50),
                                  width: MediaQuery.of(context).size.width -
                                      4 * defaultMargin,
                                  child: Text(
                                    "${documentData["judulAmal"]}",
                                    style: whiteTextFont.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                background: Stack(
                                  children: [
                                    SizedBox(
                                        height: 360,
                                        width: double.infinity,
                                        child: Carousel(
                                            radius: Radius.circular(8),
                                            dotSize: 4,
                                            dotSpacing: 15,
                                            dotColor: Colors.grey,
                                            indicatorBgPadding: 15,
                                            dotBgColor: Colors.transparent,
                                            dotVerticalPadding: 5,
                                            dotPosition:
                                                DotPosition.bottomRight,
                                            images: [
                                              for (var i = 1;
                                                  i < imageList.length;
                                                  i++)
                                                GestureDetector(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        isDismissible: true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            50))),
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return DraggableScrollableSheet(
                                                              initialChildSize:
                                                                  0.4,
                                                              builder:
                                                                  (_, controller) =>
                                                                      Container(
                                                                        color: Colors
                                                                            .white,
                                                                        child:
                                                                            Container(
                                                                          margin: EdgeInsets.fromLTRB(
                                                                              defaultMargin,
                                                                              defaultMargin,
                                                                              defaultMargin,
                                                                              0),
                                                                          child:
                                                                              ListView(
                                                                            controller:
                                                                                controller,
                                                                            children: [
                                                                              Text(
                                                                                "Detail Product",
                                                                                textAlign: TextAlign.left,
                                                                                style: blackTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              SizedBox(
                                                                                height: defaultMargin,
                                                                              ),
                                                                              Container(
                                                                                height: 100,
                                                                                width: 30,
                                                                                child: Container(
                                                                                  child: Image.network("${imageList[i]}", fit: BoxFit.cover),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ));
                                                        });
                                                  },
                                                  child: Container(
                                                    child: Image.network(
                                                        "${imageList[i]}",
                                                        fit: BoxFit.cover),
                                                  ),
                                                )
                                            ])),
                                  ],
                                ),
                              ),
                            ),
                            SliverList(
                                delegate: SliverChildListDelegate([
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: defaultMargin,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: defaultMargin,
                                          right: defaultMargin),
                                      child: Text(
                                        "${documentData["judulAmal"]}",
                                        textAlign: TextAlign.left,
                                        style: blackTextFont.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: defaultMargin,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: defaultMargin,
                                          right: defaultMargin),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              GestureDetector(
                                                child: Icon(Icons.people,
                                                    color: isFollowing
                                                        ? mainColor
                                                        : Colors.grey),
                                                onTap: () {},
                                              ),
                                              Text(followerCount.toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ],
                                          ),
                                          Container(
                                            height: 30,
                                            child: VerticalDivider(
                                              color: accentColor1,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                  child: Icon(
                                                      Icons.grade_rounded,
                                                      color: Colors.grey),
                                                  onTap: () {}),
                                              Text("Alumni",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ],
                                          ),
                                          Container(
                                            height: 30,
                                            child: VerticalDivider(
                                              color: accentColor1,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Icon(Icons.location_on_rounded,
                                                  color: Colors.grey),
                                              Text("Buku-f",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ],
                                          ),
                                          Container(
                                            height: 30,
                                            child: VerticalDivider(
                                              color: accentColor1,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            FocusNode());
                                                    this._openInWebview(
                                                        "${documentData["ebook"]}");
                                                  },
                                                  child: Icon(Icons.book,
                                                      color: Colors.grey)),
                                              Text("Buku-e",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: defaultMargin,
                                    ),
                                    Divider(
                                      thickness: 5,
                                      color: Colors.grey[200],
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: defaultMargin,
                                            right: defaultMargin),
                                        child: Text(
                                          "Ragam Materi",
                                          textAlign: TextAlign.left,
                                          style: blackTextFont.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),

                                    /* Container(
                                height: 105,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      for (var i in players)
                                        ytPlayer(i["videoID"]),
                                    ]),
                              ),*/

                                    //   Course(),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: defaultMargin,
                                            right: defaultMargin),
                                        child: Text(
                                          "Memilih kelasku",
                                          textAlign: TextAlign.left,
                                          style: greyTextFont.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      child: SingleChildScrollView(
                                          padding: const EdgeInsets.only(
                                              left: defaultMargin,
                                              right: defaultMargin),
                                          scrollDirection: Axis.horizontal,
                                          child: Materi(
                                            promateri: promateri,
                                            onSelected: (materi) {
                                              _selectedMateri = materi;
                                            },
                                          )),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                        height: 135,
                                        child: SingleChildScrollView(
                                            padding: const EdgeInsets.only(
                                                left: defaultMargin,
                                                right: defaultMargin),
                                            scrollDirection: Axis.horizontal,
                                            child: Row(children: [
                                              for (var i = 0;
                                                  i <
                                                      documentData["link"]
                                                          .length;
                                                  i++)
                                                Row(children: [
                                                  SizedBox(height: 12),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right:
                                                                defaultMargin),
                                                    width: 192,
                                                    child: Stack(children: [
                                                      FutureBuilder<List>(
                                                        future: getData(
                                                            documentData["link"]
                                                                [i]),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot.hasError)
                                                            print(
                                                                snapshot.error);
                                                          return snapshot
                                                                  .hasData
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (BuildContext context) => Playlist(
                                                                              url: '${documentData["link"][i]}',
                                                                              title: "kolki"),
                                                                        ));
                                                                  },
                                                                  child: CoverVideo(
                                                                      list: snapshot
                                                                          .data))
                                                              : SpinKitFadingCircle(
                                                                  color:
                                                                      accentColor2,
                                                                  size: 50,
                                                                );
                                                        },
                                                      )
                                                    ]),
                                                  )
                                                ])
                                            ]))), //HomePlaylist(url: url),

                                    Divider(
                                      thickness: 5,
                                      color: Colors.grey[200],
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: defaultMargin,
                                            right: defaultMargin),
                                        child: Text(
                                          "Deskripsi",
                                          textAlign: TextAlign.left,
                                          style: blackTextFont.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: defaultMargin,
                                            right: defaultMargin),
                                        child: Text(
                                            "${documentData["deskripsi"]}",
                                            textAlign: TextAlign.left,
                                            style: blackTextFont.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300))),
                                    SizedBox(
                                      height: defaultMargin,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 3, right: 3),
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: mainColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0)),
                                                child: Center(
                                                  child: Text(
                                                    "Apa Keutamaannya?",
                                                    style: blackTextFont
                                                        .copyWith(fontSize: 14),
                                                  ),
                                                )),
                                            onTap: () async {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      AssetGiffyDialog(
                                                          key: keys[1],
                                                          image: Image.network(
                                                            "${documentData["daftar"]}",
                                                            fit: BoxFit.fill,
                                                          ),
                                                          title: Text(
                                                            "${documentData["judulAmal"]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 22.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          entryAnimation:
                                                              EntryAnimation
                                                                  .BOTTOM_RIGHT,
                                                          description: Text(
                                                            "${documentData["deskripsi"]}",
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(),
                                                          ),
                                                          onOkButtonPressed:
                                                              () async {
                                                            Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true)
                                                                .pop();
                                                          }));
                                            }),
                                        //*/
                                        RaisedButton(
                                            key: keys[4],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            color: mainColor,
                                            child: //ChildWidget1(),
                                                Text(
                                              isFollowing
                                                  ? "Tamatkan"
                                                  : "Mulai Merutinkan", //  : "Tamat",
                                              style: whiteTextFont.copyWith(
                                                  fontSize: 14),
                                            ),
                                            onPressed: () async {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      AssetGiffyDialog(
                                                          key: keys[5],
                                                          image: isFollowing
                                                              ? Image.asset(
                                                                  'assets/daftar.gif',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )
                                                              : Image.asset(
                                                                  'assets/pohon_amal.gif',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                          title: Text(
                                                            "${documentData["judulBuku"]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 22.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          entryAnimation:
                                                              EntryAnimation
                                                                  .BOTTOM_RIGHT,
                                                          description: Text(
                                                            "${documentData["deskripsi"]}",
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(),
                                                          ),
                                                          onOkButtonPressed:
                                                              () async {
                                                            isFollowing
                                                                ? "Tamatkan"
                                                                : await _addToMember();
                                                            await _addToCart();
                                                            Scaffold.of(context)
                                                                .showSnackBar(
                                                                    _snackBar);

                                                            Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true)
                                                                .pop();
                                                            setState(
                                                              () {
                                                                followerCount
                                                                    .toString();
                                                              },
                                                            );
                                                          }));
                                            }),
                                      ],
                                    ),
                                    SizedBox(
                                      height: defaultMargin,
                                    ),
                                    Divider(
                                      thickness: 5,
                                      color: Colors.grey[200],
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: defaultMargin,
                                            right: defaultMargin),
                                        child: Text(
                                          "Catatanku",
                                          textAlign: TextAlign.left,
                                          style: blackTextFont.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              60,
                                      child: HistoryNav(),
                                    ),
                                  ],
                                ),
                              ),
                            ]))
                          ]);
                        }

                        return Container(); //Center(child: SpinKitFadingCircle(color: accentColor2, size: 50,));
                      }),
                  // Container( child: Center( child: Text("ID:${widget.productId}"), )),
                ]),
              ),
            )));
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
                    Navigator.pop(this.context);
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

  Future<List> getData(url) async {
    final response = await http.get(url);
    return json.decode(response.body);
  }
}

//
/*
                                        Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for (var i = 0; i < ImageList.length; i++)
                                          AnimatedContainer(
                                              duration: Duration(milliseconds: 300),
                                              curve: Curves.easeOutCubic,
                                              margin:
                                                  EdgeInsets.symmetric(horizontal: 5.0),
                                              width: _selectedPage == i ? 35.0 : 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(12.0)))
                                      ],
                                    ),*/

/*
part of 'pages.dart';

class AmalDetailPage extends StatefulWidget {
  final String productId;
  final String judulBuku;

  const AmalDetailPage({Key key, this.productId, this.judulBuku})
      : super(key: key);
  @override
  _AmalDetailPageState createState() => _AmalDetailPageState();
}

class _AmalDetailPageState extends State<AmalDetailPage> {
  String videoID = "5qap5aO4i9A";
  List<Map<String, dynamic>> players = [
    {"videoID": "PFO-ZSofj2c", "quality": ThumbnailQuality.max},
    {"videoID": "EgMi4aH4il4", "quality": ThumbnailQuality.max},
    {"videoID": "bhu0x4hoddA", "quality": ThumbnailQuality.max}
  ];
  final List<String> _ids = [
    '97rclA4ymO4',
    '83YUZSXf7fA',
    'JD4k7WyMUQQ',
    'KvPs60lTjio',
    'zkDy7hNjgw4',
    '9WouyxEiLyQ',
    'bFUhfGI3SQg',
    'czdN5o6KSlQ',
    'FH3WGe-gqps',
  ];
  PageController _pageController = new PageController();
  int _selectedPage = 0;
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Hati");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(children: [
          FutureBuilder(
              future: _productsRef.doc(widget.productId).get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("error${snapshot.error}"),
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  //fb data map
                  Map<String, dynamic> documentData = snapshot.data.data();
                  //list of images
                  List ImageList = documentData['gambar'];
                  return CustomScrollView(slivers: [
                    SliverAppBar(
                      elevation: 0,
                      backgroundColor: mainColor,
                      floating: true,
                      expandedHeight: 320,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(widget.productId),
                        background: Stack(
                          children: [
                            Container(
                                height: 360,
                                child: PageView(controller: _pageController,
                                    /*onPageChanged: (num) {
                                            setState(() {
                                              _selectedPage = num;
                                            });
                                          },*/
                                    children: [
                                      for (var i = 0; i < ImageList.length; i++)
                                        Container(
                                            child: Image.network(
                                                "${ImageList[i]}",
                                                fit: BoxFit.fill))
                                    ])),
                            Positioned(
                                top: 50,
                                left: 0,
                                right: 0,
                                child: Container(
                                  child: Center(
                                      child: SmoothPageIndicator(
                                    controller: _pageController,
                                    effect: ExpandingDotsEffect(
                                        activeDotColor: mainColor,
                                        dotColor: Colors.white.withOpacity(0.9),
                                        dotHeight: 8,
                                        dotWidth: 8,
                                        expansionFactor: 4),
                                    /*WormEffect(
                                        dotWidth: 10,
                                        dotHeight: 10,
                                        activeDotColor: Colors.blue),*/
                                    onDotClicked: (index) =>
                                        _pageController.animateToPage(index,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.bounceOut),
                                    count: 6,
                                  )),
                                )

                                //
/*
                                        Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for (var i = 0; i < ImageList.length; i++)
                                          AnimatedContainer(
                                              duration: Duration(milliseconds: 300),
                                              curve: Curves.easeOutCubic,
                                              margin:
                                                  EdgeInsets.symmetric(horizontal: 5.0),
                                              width: _selectedPage == i ? 35.0 : 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(12.0)))
                                      ],
                                    ),*/
                                ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 71,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment(0, 1),
                                          end: Alignment(0, 0.06),
                                          colors: [
                                        Colors.white,
                                        Colors.white.withOpacity(0)
                                      ])),
                                )),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Text(
                            "Judul Buku",
                            textAlign: TextAlign.left,
                            style: blackTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.people),
                                  Text("3000 Pelajar",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300)),
                                ],
                              ),
                              Container(
                                height: 30,
                                child: VerticalDivider(
                                  color: accentColor2,
                                ),
                              ),
                              Column(
                                children: [
                                  Icon(Icons.graphic_eq_outlined),
                                  Text("Modus",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300)),
                                ],
                              ),
                              Container(
                                height: 30,
                                child: VerticalDivider(
                                  color: accentColor2,
                                ),
                              ),
                              Column(
                                children: [
                                  Icon(Icons.grade),
                                  Text("Alumni",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300)),
                                ],
                              ),
                              Container(
                                height: 30,
                                child: VerticalDivider(
                                  color: accentColor2,
                                ),
                              ),
                              Column(
                                children: [
                                  Icon(Icons.label_important),
                                  Text("Tingkat",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "Mengapa mengkaji?",
                                    style: blackTextFont.copyWith(fontSize: 14),
                                  ),
                                  onPressed: () {}),
                              RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  color: mainColor,
                                  child: Text(
                                    "Gabung mengkaji",
                                    style: whiteTextFont.copyWith(fontSize: 14),
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Text(
                            "Ragam Materi",
                            textAlign: TextAlign.left,
                            style: blackTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 105,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  for (var i in players) ytPlayer(i["videoID"]),
                                  ytPlayer(videoID),
                                  ytPlayer(videoID),
                                ]),
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Text(
                            "Deskripsi",
                            textAlign: TextAlign.left,
                            style: blackTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                            textAlign: TextAlign.left,
                            style: blackTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Text(
                            "Catatanku",
                            textAlign: TextAlign.left,
                            style: blackTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 60,
                            child: MyNote(),
                          ),
                        ],
                      ),
                    ]))
                  ]);
                }

                return Scaffold(
                    body: Center(
                        child: SpinKitFadingCircle(
                  color: accentColor2,
                  size: 50,
                )));
              }),
          // Container( child: Center( child: Text("ID:${widget.productId}"), )),
        ]),
      ),
    );
  }

  void _showDialog(context, videoID) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Container(
          color: Colors.pink,
        );
      },
    );
  }

  Widget ytPlayer(videoID) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _showDialog(
            context,
            videoID,
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (kIsWeb && constraints.maxWidth > 800) {
                      return Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: new Image.network(
                            YoutubePlayerController.getThumbnail(
                                videoId: videoID,
                                // todo: get thumbnail quality from list
                                quality: ThumbnailQuality.max,
                                webp: false),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: new Image.network(
                            YoutubePlayerController.getThumbnail(
                                videoId: videoID,
                                // todo: get thumbnail quality from list
                                quality: ThumbnailQuality.max,
                                webp: false),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            Icon(
              Icons.play_circle_filled,
              color: Colors.white,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
*/
