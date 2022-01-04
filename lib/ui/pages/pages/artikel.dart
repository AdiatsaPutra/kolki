part of 'pages.dart';

class Artikel extends StatefulWidget {
  const Artikel({Key key}) : super(key: key);

  @override
  _ArtikelState createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  Future _addMyCoin(int balance) {
    return _firebaseServices.usersCollection
        .doc(_firebaseServices.getUserId())
        .update({"balance": balance});
  }

  FirebaseServices _firebaseServices = FirebaseServices();
  int total = 10;
  int balance;
  List<String> title = List();
  List<String> time = List();
  List<String> link = List();
  List<String> pict = List();
  List<String> kategori = List();

  void _getDataFromWeb() async {
    final response = await http.get('https://ruqoyyah.com');
    dom.Document document = parser.parse(response.body);

    final linkurl = document
        .getElementsByClassName('entry-title td-module-title'); //"rpwe-title");
    final date =
        document.getElementsByClassName('td-post-date'); //"rpwe-summary");
    final elements =
        document.getElementsByClassName('entry-title td-module-title');
    final img = document.getElementsByClassName('td-image-wrap');

    final category = document.getElementsByClassName('td-big-grid-meta');
    setState(() {
      title = elements
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();

      time = date
          .map((element) => element.getElementsByTagName("time")[0].innerHtml)
          .toList();
      link = linkurl
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["href"])
          .toList();
      pict = img
          .map((element) =>
              element.getElementsByTagName("img")[0].attributes["data-img-url"])
          .toList();
      kategori = category
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();
    });
  }

  List<String> title0 = List();
  List<String> time0 = List();
  List<String> link0 = List();

  List<String> pict0 = List();

  List<String> kategori0 = List();

  void _getDataFromWeb0() async {
    final response = await http.get('https://almanhaj.or.id');
    dom.Document document = parser.parse(response.body);

    final linkurl0 =
        document.getElementsByClassName('rpwe-title'); //"rpwe-title");
    final date0 = document
        .getElementsByClassName('rpwe-li rpwe-clearfix'); //"rpwe-summary");
    final elements0 = document.getElementsByClassName('rpwe-title');
    // final img = document.getElementsByClassName('rpwe-li rpwe-clearfix');

    final category0 = document.getElementsByClassName('rpwe-li rpwe-clearfix');
    setState(() {
      title0 = elements0
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();

      time0 = date0
          .map((element) => element.getElementsByTagName("time")[0].innerHtml)
          .toList();
      link0 = linkurl0
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["href"])
          .toList();
      // pict = img.map((element) =>element.getElementsByTagName("a")[0].attributes["rpwe-img"]).toList();
      kategori0 = category0
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["rpwe-img"])
          .toList();
    });
  }

  List<String> title00 = List();
  List<String> time00 = List();
  List<String> link00 = List();

  List<String> pict00 = List();

  List<String> kategori00 = List();

  void _getDataFromWeb00() async {
    final response = await http.get('https://nasehat.net');
    dom.Document document = parser.parse(response.body);

    final linkurl00 =
        document.getElementsByClassName('entry-header'); //"rpwe-title");
    final date00 =
        document.getElementsByClassName('posted-on'); //"rpwe-summary");
    final elements00 = document.getElementsByClassName('entry-header');
    // final img = document.getElementsByClassName('rpwe-li rpwe-clearfix');

    // final category00 = document.getElementsByClassName('rpwe-li rpwe-clearfix');
    setState(() {
      title00 = elements00
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();

      time00 = date00
          .map((element) => element.getElementsByTagName("time")[0].innerHtml)
          .toList();
      link00 = linkurl00
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["href"])
          .toList();
      // pict = img.map((element) =>element.getElementsByTagName("a")[0].attributes["rpwe-img"]).toList();
      //kategori00 = category00
      //  .map((element) =>
      //    element.getElementsByTagName("a")[0].attributes["rpwe-img"])
      //.toList();
    });
  }

  List<String> title1 = List();
  List<String> time1 = List();
  List<String> link1 = List();

  List<String> pict1 = List();

  List<String> kategori1 = List();

  void _getDataFromWeb1() async {
    final response = await http.get('https://konsultasisyariah.com');
    dom.Document document = parser.parse(response.body);
    final linkurl1 = document
        .getElementsByClassName('entry-title td-module-title'); //"rpwe-title");
    final date1 =
        document.getElementsByClassName('td-post-date'); //"rpwe-summary");
    final elements1 =
        document.getElementsByClassName('entry-title td-module-title');
    final img1 = document.getElementsByClassName('rpwe-li rpwe-clearfix');

    final category1 =
        document.getElementsByClassName('block-title td-block-title');
    setState(() {
      title1 = elements1
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();

      time1 = date1
          .map((element) => element.getElementsByTagName("time")[0].innerHtml)
          .toList();
      link1 = linkurl1
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["href"])
          .toList();
      pict1 = img1
          .map((element) => element
              .getElementsByTagName("a")[0]
              .innerHtml) //.attributes["rpwe-img"])
          .toList();
      kategori1 = category1
          .map((element) => element.getElementsByTagName("span")[0].innerHtml)
          .toList();
    });
  }

  List<String> title2 = List();
  List<String> time2 = List();
  List<String> link2 = List();
  List<String> pict2 = List();
  List<String> kategori2 = List();
  void _getDataFromWeb2() async {
    final response = await http.get('https://khotbahjumat.com');
    dom.Document document = parser.parse(response.body);
    final linkurl2 =
        document.getElementsByClassName('cb-article-meta'); //"rpwe-title");
    final date2 = document
        .getElementsByClassName('cb-date cb-byline-element'); //"rpwe-summary");
    final elements2 = document.getElementsByClassName('cb-article-meta');
    final img2 = document.getElementsByClassName('rpwe-li rpwe-clearfix');

    final category2 =
        document.getElementsByClassName('cb-category cb-byline-element');
    setState(() {
      title2 = elements2
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();

      time2 = date2
          .map((element) => element.getElementsByTagName("time")[0].innerHtml)
          .toList();
      link2 = linkurl2
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["href"])
          .toList();
      pict2 = img2
          .map((element) => element
              .getElementsByTagName("a")[0]
              .innerHtml) //.attributes["rpwe-img"])
          .toList();
      kategori2 = category2
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();
    });
  }

  List<String> title3 = List();
  List<String> time3 = List();
  List<String> link3 = List();
  List<String> pict3 = List();
  List<String> kategori3 = List();
  void _getDataFromWeb3() async {
    final response = await http.get('https://muslim.or.id/');
    dom.Document document = parser.parse(response.body);
    final linkurl3 =
        document.getElementsByClassName('post-title'); //"rpwe-title");
    final date3 =
        document.getElementsByClassName('post-meta-date'); //"rpwe-summary");
    final elements3 = document.getElementsByClassName('post-title');
    final img3 = document.getElementsByClassName('post-thumb-link');
    final category3 = document.getElementsByClassName('post-meta-author');
    setState(() {
      title3 = elements3
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();

      // time3 = date3
      //   .map((element) => element.getElementsByTagName("span")[0].innerHtml)
      // .toList();
      link3 = linkurl3
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["href"])
          .toList();
      pict3 = img3
          .map((element) => element
              .getElementsByTagName("img")[0]
              .attributes["src"]) //.attributes["rpwe-img"])
          .toList();
      kategori3 = category3
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();
    });
  }

  List<String> title4 = List();
  List<String> time4 = List();
  List<String> link4 = List();
  List<String> pict4 = List();
  List<String> kategori4 = List();
  void _getDataFromWeb4() async {
    final response = await http.get('https://muslimah.or.id');
    dom.Document document = parser.parse(response.body);
    final linkurl4 =
        document.getElementsByClassName('post-title'); //"rpwe-title");
    final date4 =
        document.getElementsByClassName('post-meta-date'); //"rpwe-summary");
    final elements4 = document.getElementsByClassName('post-title');
    final img4 = document.getElementsByClassName('rpwe-li rpwe-clearfix');
    final category4 = document.getElementsByClassName('post-meta-author');
    setState(() {
      title4 = elements4
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();
      time4 = date4
          .map((element) => element.getElementsByTagName("i")[0].innerHtml)
          .toList();
      link4 = linkurl4
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["href"])
          .toList();
      pict4 = img4
          .map((element) => element
              .getElementsByTagName("a")[0]
              .innerHtml) //.attributes["rpwe-img"])
          .toList();
      kategori4 = category4
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();
    });
  }

  List<String> title5 = List();
  List<String> time5 = List();
  List<String> link5 = List();
  List<String> pict5 = List();
  List<String> kategori5 = List();

  List<String> penulis5 = List();
  void _getDataFromWeb5() async {
    final response = await http.get('https://muslimafiyah.com');
    dom.Document document = parser.parse(response.body);

    final linkurl5 =
        document.getElementsByClassName('post-title'); //"rpwe-title");
    final date5 = document.getElementsByClassName(
        'post-meta post-archive-meta'); //"rpwe-summary");
    final elements5 = document.getElementsByClassName('post-title');
    final img5 = document.getElementsByClassName('rpwe-li rpwe-clearfix');
    final category5 = document.getElementsByClassName('post-meta-cat');

    final author5 = document.getElementsByClassName('post-meta-author');
    setState(() {
      title5 = elements5
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();
      time5 = date5
          .map((element) => element
              .getElementsByTagName("span")[0]
              .attributes["post-meta-date"])
          .toList();
      link5 = linkurl5
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["href"])
          .toList();
      pict5 = img5
          .map((element) => element
              .getElementsByTagName("a")[0]
              .innerHtml) //.attributes["rpwe-img"])
          .toList();
      kategori5 = category5
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();
      penulis5 = author5
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();
    });
  }

  List<String> title6 = List();
  List<String> time6 = List();
  List<String> link6 = List();
  List<String> pict6 = List();
  List<String> kategori6 = List();

  List<String> penulis6 = List();
  void _getDataFromWeb6() async {
    final response = await http.get('https://rumaysho.com');
    dom.Document document = parser.parse(response.body);

    final linkurl6 =
        document.getElementsByClassName('thumb-title'); //"rpwe-title");
    final date6 =
        document.getElementsByClassName('thumb-meta'); //"rpwe-summary");
    final elements6 = document.getElementsByClassName('thumb-title');
    //final img6 = document.getElementsByClassName('rpwe-li rpwe-clearfix');
    //final category6 = document.getElementsByClassName('post-content');

    //final author6 = document.getElementsByClassName('meta-author');
    setState(() {
      title6 = elements6
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();
      time6 = date6
          .map((element) => element.getElementsByTagName("span")[0].innerHtml)
          .toList();
      link6 = linkurl6
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["href"])
          .toList();
      //pict6 = img6
      ///  .map((element) => element
      //   .getElementsByTagName("a")[0]
      // .innerHtml) //.attributes["rpwe-img"])
      //.toList();
      //kategori6 = category6
      //  .map((element) => element.getElementsByTagName("a")[0].innerHtml)
      //.toList();
      ///penulis6 = author6
      // .map((element) => element.getElementsByTagName("a")[0].innerHtml)
      //.toList();
    });
  }

  List<String> title7 = List();
  List<String> time7 = List();
  List<String> link7 = List();
  List<String> pict7 = List();
  List<String> kategori7 = List();

  List<String> penulis7 = List();
  void _getDataFromWeb7() async {
    final response = await http.get('https://kisahmuslim.com');
    dom.Document document = parser.parse(response.body);

    final linkurl7 =
        document.getElementsByClassName('entry-title'); //"rpwe-title");
    // final date6 = document
    //   .getElementsByClassName('post-meta clearfix'); //"rpwe-summary");
    final elements7 = document.getElementsByClassName('entry-title');
    //final img6 = document.getElementsByClassName('rpwe-li rpwe-clearfix');
    //final category6 = document.getElementsByClassName('post-content');

    //final author6 = document.getElementsByClassName('meta-author');
    setState(() {
      title7 = elements7
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();
      //time6 = date6
      //  .map((element) => element.getElementsByTagName("span")[0].innerHtml)
      //.toList();
      link7 = linkurl7
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes["href"])
          .toList();
      //pict6 = img6
      ///  .map((element) => element
      //   .getElementsByTagName("a")[0]
      // .innerHtml) //.attributes["rpwe-img"])
      //.toList();
      //kategori6 = category6
      //  .map((element) => element.getElementsByTagName("a")[0].innerHtml)
      //.toList();
      ///penulis6 = author6
      // .map((element) => element.getElementsByTagName("a")[0].innerHtml)
      //.toList();
    });
  }

  @override
  void initState() {
    _getDataFromWeb();
    _addMyCoin(balance);
    _getDataFromWeb00();
    _getDataFromWeb0();
    _getDataFromWeb1();
    _getDataFromWeb2();
    _getDataFromWeb3();
    _getDataFromWeb4();

    _getDataFromWeb5();
    _getDataFromWeb6();

    _getDataFromWeb7();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<UserBloc, UserState>(
      //pakai blocbuilder karena yg dipilihnya ada di data user
      builder: (_, userState) {
        if (userState is UserLoaded) {
          return ScrollableListTabView(tabHeight: 60, tabs: [
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
                      Text("Almanhaj", style: TextStyle(fontSize: 10)),
                    ],
                  )),
              body:
                  /*title.length == 0
            ?  Container(
                child: SpinKitFadingCircle(
                color: accentColor2,
                size: 50,
              ))
            :*/
                  ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: title0.length,
                itemBuilder: (_, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                        onTap: () async {
                          dynamic url = link0[index];
                          // context.read<PoinBloc>().add(Incrementt());
                          //_addMyCoin(balance = userState.user.balance + total);
                          //_addMyCoin(balance = userState.user.balance + total);
                          context.read<UserBloc>().add(Increment());
                          FocusScope.of(context).requestFocus(FocusNode());
                          this._openInWebview(url);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                              child: Container(
                            child: Center(child: Text("${index + 1}")),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(""),
                            )),
                          )), // ),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(time0[index] ?? "",
                                    style: TextStyle(fontSize: 10)),
                                Text(title0[index] ?? "")
                              ]),
                          // subtitle: Text(kategori[index] ?? "")
                        ),
                      ))));
                },
              ),
            ),
            /*  ScrollableListTab(
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
                      Text("Ruqoyyah", style: TextStyle(fontSize: 10)),
                    ],
                  )),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                                  onTap: () async {
                                    dynamic url = link[index];

                                    _addMyCoin(balance =
                                        userState.user.balance + total);
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    this._openInWebview(url);
                                  },
                                  child: ListTile(
                                    // isThreeLine: true,
                                    leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          pict[index],
                                        ),
                                        child: Text(
                                          "${index + 1}",
                                        )),
                                    title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(time[index] ?? "",
                                              style: TextStyle(fontSize: 10)),
                                          Text(title[index] ?? "")
                                        ]),
                                    //subtitle: Text(kategori[index] ?? "")),
                                  )))));
                },
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
                      Text("konsultasisyariah.com",
                          style: TextStyle(fontSize: 10)),
                    ],
                  )),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                        onTap: () async {
                          dynamic url = link1[index];

                          FocusScope.of(context).requestFocus(FocusNode());
                          this._openInWebview(url);
                        },
                        child: ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                                child: Container(
                              child: Center(child: Text("${index + 1}")),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(""),
                              )),
                            )), //
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(time1[index] ?? "",
                                      style: TextStyle(fontSize: 10)),
                                  Text(title1[index] ?? "")
                                ]),
                            subtitle: Text(kategori1[index] ?? "")),
                      ))));
                },
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
                      Text("nasehat.net", style: TextStyle(fontSize: 10)),
                    ],
                  )),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: link00.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                        onTap: () async {
                          dynamic url = link00[index];

                          FocusScope.of(context).requestFocus(FocusNode());
                          this._openInWebview(url);
                        },
                        child: ListTile(
                          // isThreeLine: true,
                          leading: CircleAvatar(
                              child: Container(
                            child: Center(child: Text("${index + 1}")),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(''),
                            )),
                          )), //
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(time00[index] ?? "",
                                    style: TextStyle(fontSize: 10)),
                                Text(title00[index] ?? "")
                              ]),
                          //subtitle: Text(kategori00[index] ?? "")
                        ),
                      ))));
                },
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
                      Text("Khutbah Jumat", style: TextStyle(fontSize: 10)),
                    ],
                  )),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: link2.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                        onTap: () async {
                          dynamic url = link2[index];

                          FocusScope.of(context).requestFocus(FocusNode());
                          this._openInWebview(url);
                        },
                        child: ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                                child: Container(
                              child: Center(child: Text("${index + 1}")),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(""),
                              )),
                            )), // / ),
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(time2[index] ?? "",
                                      style: TextStyle(fontSize: 10)),
                                  Text(title2[index] ?? "")
                                ]),
                            subtitle: Text(kategori2[index] ?? "")),
                      ))));
                },
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
                      Text("muslim.or.id", style: TextStyle(fontSize: 10)),
                    ],
                  )),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: link3.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                        onTap: () async {
                          dynamic url = link3[index];

                          FocusScope.of(context).requestFocus(FocusNode());
                          this._openInWebview(url);
                        },
                        child: ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                                child: Container(
                              child: Center(child: Text("${index + 1}")),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(''),
                              )),
                            )), // ,
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Text(time3[index] ?? "",
                                  //  style: TextStyle(fontSize: 10)),
                                  Text(title3[index] ?? "")
                                ]),
                            subtitle: Text(kategori3[index] ?? "")),
                      ))));
                },
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
                      Text("muslimah.or.id", style: TextStyle(fontSize: 10)),
                    ],
                  )),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 11,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                        onTap: () async {
                          dynamic url = link4[index];

                          FocusScope.of(context).requestFocus(FocusNode());
                          this._openInWebview(url);
                        },
                        child: ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                                child: Container(
                              child: Center(child: Text("${index + 1}")),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(''),
                              )),
                            )), // ,
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(time4[index] ?? "",
                                      style: TextStyle(fontSize: 10)),
                                  Text(title4[index] ?? "")
                                ]),
                            subtitle: Text(kategori4[index] ?? "")),
                      ))));
                },
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
                      Text("muslimafiyah.com", style: TextStyle(fontSize: 10)),
                    ],
                  )),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                        onTap: () async {
                          dynamic url = link5[index];

                          FocusScope.of(context).requestFocus(FocusNode());
                          this._openInWebview(url);
                        },
                        child: ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                                child: Container(
                              child: Center(child: Text("${index + 1}")),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(""),
                              )),
                            )), // ,
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(time5[index] ?? "",
                                      style: TextStyle(fontSize: 10)),
                                  Text(title5[index] ?? "")
                                ]),
                            subtitle: Row(
                              children: [
                                Text(kategori5[index] ?? ""),
                                Text(":"),
                                Text(penulis5[index] ?? ""),
                              ],
                            )),
                      ))));
                },
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
                      Text("rumaysho.com", style: TextStyle(fontSize: 10)),
                    ],
                  )),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: link6.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                        onTap: () async {
                          dynamic url = link6[index];

                          FocusScope.of(context).requestFocus(FocusNode());
                          this._openInWebview(url);
                        },
                        child: ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                                child: Container(
                              child: Center(child: Text("${index + 1}")),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(""),
                              )),
                            )), // ,
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(time6[index] ?? "",
                                      style: TextStyle(fontSize: 10)),
                                  Text(title6[index] ?? "")
                                ]),
                            subtitle: Row(
                              children: [
                                // Text(kategori6[index] ?? ""),
                                //Text(":"),
                                // Text(penulis6[index] ?? ""),
                              ],
                            )),
                      ))));
                },
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
                      Text("rumaysho.com", style: TextStyle(fontSize: 10)),
                    ],
                  )),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: link7.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                        onTap: () async {
                          dynamic url = link7[index];

                          FocusScope.of(context).requestFocus(FocusNode());
                          this._openInWebview(url);
                        },
                        child: ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                                child: Container(
                              child: Center(child: Text("${index + 1}")),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                  "",
                                ),
                              )),
                            )), // ,
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
//Text(time6[index] ?? "",
                                  //   style: TextStyle(fontSize: 10)),
                                  Text(title7[index] ?? "")
                                ]),
                            subtitle: Row(
                              children: [
                                // Text(kategori6[index] ?? ""),
                                // Text(":"),
                                // Text(penulis6[index] ?? ""),
                              ],
                            )),
                      ))));
                },
              ),
            ),
          */
          ]);
        } else {
          return SpinKitFadingCircle(
            color: mainColor,
            size: 50,
          );
        }
      },
    ));
  }

  Future<Null> _openInWebview(String url) async {
    if (await url_launcher.canLaunch(url)) {
      Navigator.of(this.context).push(
        MaterialPageRoute(
          builder: (ctx) => WebviewScaffold(
            initialChild: Center(child: CircularProgressIndicator()),
            url: url,
            appBar: AppBar(
                title: Text("Selemat, anda menambah 10 poin"),
                backgroundColor: mainColor,
                actions: [
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
}
