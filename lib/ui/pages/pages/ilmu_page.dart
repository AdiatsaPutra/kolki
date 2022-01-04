part of 'pages.dart';

class MyIlmuPage extends StatefulWidget {
  MyIlmuPage({Key key, this.title, this.productId, this.dd}) : super(key: key);
  final String productId;
  final String title;
  final Future<DocumentSnapshot> dd;
  @override
  _MyIlmuPageState createState() => _MyIlmuPageState(this.dd);
}

class _MyIlmuPageState extends State<MyIlmuPage> {
  final Future<DocumentSnapshot> dd;
  String value;
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Buku");

  final CollectionReference _anakRef =
      FirebaseFirestore.instance.collection("Anak");
  final CollectionReference _manhajRef =
      FirebaseFirestore.instance.collection("Manhaj");

  final CollectionReference _semuaRef =
      FirebaseFirestore.instance.collection("Semua");

  _MyIlmuPageState(this.dd);

  final List<String> _gambar = [
    'assets/ic_horror.png',
    'assets/ic_crime.png',
    'assets/ic_movie.png',
  ];
  final List<String> _nama = [
    'products',
    'anak',
    'manhaj',
  ];
  _addFolder() async {
    return Future.wait([
      _productsRef.doc(widget.productId).get(),
      _anakRef.doc(widget.productId).get(),
      _manhajRef.doc(widget.productId).get(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: SafeArea(
          child: ScrollableListTabView(
            tabHeight: 60,
            tabs: [
              // for (var i = 1; i < documentData["koleksi"].length; i++)
              ScrollableListTab(
                tab: ListTab(
                    activeBackgroundColor: Color(0xff3fada8),
                    label: Column(
                      children: [
                        Container(
                          width: 29,
                          height: 34,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                'assets/kolki_logo.png',
                              )) //_gambar[i])),
                              ),
                        ),
                        Text("Sekolah", style: TextStyle(fontSize: 10)),
                      ],
                    )),
                body: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (_, index) => Buku(
                    //buku ini memuat tiap      document dicollection
                    koleksi: _productsRef.get(),
                    dokumen: _productsRef
                        .doc(widget.productId)
                        .get(), // ini querysnapshot tiap collection
                  ),
                ),
              ),
              ScrollableListTab(
                tab: ListTab(
                    activeBackgroundColor: Color(0xff3fada8),
                    label: Column(
                      children: [
                        Container(
                          width: 29,
                          height: 34,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                'assets/kolki_logo.png',
                              )) //_gambar[i])),
                              ),
                        ),
                        Text("Adab dan Akhlak", style: TextStyle(fontSize: 10)),
                      ],
                    )),
                body: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (_, index) => Buku(
                    koleksi: _manhajRef.get(),
                    dokumen: _manhajRef.doc(widget.productId).get(),
                  ),
                ),
              ),
              /*ScrollableListTab(
                  tab: ListTab(
                      label: Column(
                    children: [
                      Container(
                        width: 20,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/kolki_logo.png")),
                        ),
                      ),
                      Text("  Adab Akhlak", style: TextStyle(fontSize: 10)),
                    ],
                  )),
                  body: ListView.builder(
                    dragStartBehavior: DragStartBehavior.start,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (_, index) => ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        alignment: Alignment.center,
                        child: Text(index.toString()),
                      ),
                      title: Text('List element $index'),
                    ),
                  )),*/
            ],
          ),
        ),
      ),
    ]);
  }
}

class Buku extends StatefulWidget {
  final Future<QuerySnapshot> koleksi;
  final Future<DocumentSnapshot> dokumen;
  final String productId;
  const Buku({
    Key key,
    this.productId,
    @required this.dokumen,
    @required this.koleksi,
  }) : super(key: key);
  @override
  _BukuState createState() => _BukuState(
        this.koleksi,
        this.dokumen,
        this.productId,
      );
}

class _BukuState extends State<Buku> {
  final Future<QuerySnapshot> koleksi;

  final Future<DocumentSnapshot> dokumen;
  final String productId;
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Buku");
  _BukuState(this.koleksi, this.dokumen, this.productId);
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: koleksi, //minta apapun dalam koleksi
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Scaffold(
                body: Center(
                  child: Text("error${snapshot.error}"),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Wrap(
                spacing: 10,
                runSpacing: 16,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: snapshot.data.docs.map((document) {
                  return Stack(children: [
                    GestureDetector(
                      onLongPress: () {},
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IlmuDetailPage(
                                    productId: document.id, dokumen: dokumen)));
                      },
                      child: Column(children: [
                        Stack(children: [
                          Container(
                              height: 158,
                              width: 102,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${document.data()["gambar"][0]}"),
                                  ))),
                          Positioned(
                            top: 136,
                            child: Container(
                              height: 22,
                              width: 102,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                                color: accentColor1,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.7)
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            bottom: 2,
                            child: Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.white, size: 10.0),
                                Text(
                                  followerCount.toString(),
                                  textAlign: TextAlign.end,
                                  style: whiteTextFont.copyWith(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                          )
                        ]),
                        Container(
                          width: 102,
                          child: Text(
                            "${document.data()["judulBuku"]}",
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: blackTextFont.copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 102,
                          child: Text(
                            "${document.data()["penulis"]}",
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: blackTextFont.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                    )
                  ]);
                }).toList());
          }
          return SpinKitFadingCircle(
            color: accentColor2,
            size: 50,
          );
        });
  }

  int followerCount = 0;

  @override
  void initState() {
    super.initState();
    getFollowers();
  }

  getFollowers() async {
    QuerySnapshot snapshot = await _firebaseServices.productsRef
        .doc(widget.productId)
        .collection("member")
        .getDocuments();
    setState(() {
      followerCount = snapshot.size;
    });
  }
}

/*  return FutureBuilder(
        future: _semuaRef.get(), //minta apapun dalam koleksi
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Scaffold(
                body: Center(
                  child: Text("error${snapshot.error}"),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {

              Map<String, dynamic> documentData = snapshot.data.data();
            return Stack(children: [
      Scaffold(
        body: SafeArea(
          child: ScrollableListTabView(
            tabHeight: 60,
            tabs: [
              for (var i = 1; i < documentData["koleksi"].length; i++)
              ScrollableListTab(
                tab: ListTab(
                    activeBackgroundColor: Color(0xff3fada8),
                    label: Column(
                      children: [
                        Container(
                          width: 29,
                          height: 34,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                'assets/ic_movie.png',
                              )) //_gambar[i])),
                              ),
                        ),
                        Text("products", style: TextStyle(fontSize: 10)),
                      ],
                    )),
                body: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (_, index) => Buku(
                    koleksi: _productsRef.get(),
                  ),
                ),
              ),
             ScrollableListTab(
                  tab: ListTab(
                      label: Column(
                    children: [
                      Container(
                        width: 20,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/kolki_logo.png")),
                        ),
                      ),
                      Text("  Adab Akhlak", style: TextStyle(fontSize: 10)),
                    ],
                  )),
                  body: ListView.builder(
                    dragStartBehavior: DragStartBehavior.start,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (_, index) => ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        alignment: Alignment.center,
                        child: Text(index.toString()),
                      ),
                      title: Text('List element $index'),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ]); }
          return SpinKitFadingCircle(
            color: accentColor2,
            size: 50,
          );
        });
  }
}*/
