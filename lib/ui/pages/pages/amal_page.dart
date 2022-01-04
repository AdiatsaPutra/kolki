part of 'pages.dart';

class MyAmalPage extends StatefulWidget {
  MyAmalPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAmalPageState createState() => _MyAmalPageState();
}

class _MyAmalPageState extends State<MyAmalPage> {
  final CollectionReference _hatiRef =
      FirebaseFirestore.instance.collection("Hati");
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: SafeArea(
          child: ScrollableListTabView(
            tabHeight: 60,
            tabs: [
              ScrollableListTab(
                tab: ListTab(
                    activeBackgroundColor: Color(0xff3fada8),
                    label: Column(
                      children: [
                        Container(
                          width: 20,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/user_pic.png")),
                          ),
                        ),
                        Text("Badan + Hati", style: TextStyle(fontSize: 10)),
                      ],
                    )),
                body: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (_, index) => FutureBuilder<QuerySnapshot>(
                      future: _hatiRef.get(), //minta apapun dalam koleksi
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
                              spacing: 0,
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: snapshot.data.docs.map((document) {
                                return Stack(children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AmalDetailPage(
                                                    productId: document.id,
                                                  )));

                                      //Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage()));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.only(
                                              left: 0.0,
                                              right: 12.0,
                                              top: 0.0,
                                              bottom: 0.0),
                                          dense: false,
                                          leading: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "${document.data()["gambar"][0]}"),
                                                )),
                                          ),
                                          title: Align(
                                            alignment: Alignment(-1.2, 0),
                                            child: Text(
                                              "${document.data()["judulAmal"]}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: blackTextFont.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          subtitle: Align(
                                            alignment: Alignment(-1.17, 0),
                                            child: Text(
                                              "${document.data()["deskripsi"]}",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Divider(indent: 80)
                                      ],
                                    ),
                                  ),
                                ]);
                              }).toList());
                        }
                        return SpinKitFadingCircle(
                          color: accentColor2,
                          size: 50,
                        );
                      }),
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
                              image: AssetImage("assets/user_pic.png")),
                        ),
                      ),
                      Text(
                        "Lisan + Hati",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  )),
                  body: ListView.builder(
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
                              image: AssetImage("assets/user_pic.png")),
                        ),
                      ),
                      Text("Hati", style: TextStyle(fontSize: 10)),
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
                              image: AssetImage("assets/user_pic.png")),
                        ),
                      ),
                      Text("Harta+ Hati", style: TextStyle(fontSize: 10)),
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
    ]);
  }
}
