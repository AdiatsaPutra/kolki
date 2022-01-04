part of 'pages.dart';

class MyReward extends StatefulWidget {
  const MyReward({Key key}) : super(key: key);
  @override
  _MyRewardState createState() => _MyRewardState();
}

class _MyRewardState extends State<MyReward> {
  /*Future _calculateMyCoin(int balance) {
    return _firebaseServices.usersCollection
        .doc(_firebaseServices.getUserId())
        .update({"balance": balance});
  }*/

  final CollectionReference _tvRef =
      FirebaseFirestore.instance.collection("Tv");
  FirebaseServices _firebaseServices = FirebaseServices();
  int total = 30;
  int balance;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      //pakai blocbuilder karena yg dipilihnya ada di data user
      builder: (_, userState) {
        if (userState is UserLoaded) {
          return Scaffold(
              appBar: AppBar(
                  backgroundColor: mainColor,
                  title: Text(
                      "Tukar koinmu (${userState.user.balance}) dengan Hadiah Menakjubkan",
                      style: TextStyle(fontSize: 12))),
              body: FutureBuilder<DocumentSnapshot>(
                  future:
                      _tvRef.doc('reward').get(), //minta apapun dalam koleksi
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
                      return Center(
                          child: Wrap(
                              spacing: 10,
                              runSpacing: 16,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                for (var i = 0;
                                    i < documentData["reward"].length;
                                    i++)
                                  GestureDetector(
                                      onLongPress: () {},
                                      onTap: () {
                                        userState.user.balance >= total
                                            ? context
                                                .read<UserBloc>()
                                                .add(Decrement())
                                            /*_calculateMyCoin(balance =
                                                userState.user.balance - total)*/
                                            : "";

                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            isDismissible: true,
                                            backgroundColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            50))),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return DraggableScrollableSheet(
                                                  initialChildSize: 0.4,
                                                  builder:
                                                      (_, controller) =>
                                                          Container(
                                                            color: Colors.white,
                                                            child: Container(
                                                              margin: EdgeInsets.fromLTRB(
                                                                  defaultMargin,
                                                                  defaultMargin,
                                                                  defaultMargin,
                                                                  0),
                                                              child: ListView(
                                                                controller:
                                                                    controller,
                                                                children: [
                                                                  userState.user
                                                                              .balance >=
                                                                          total
                                                                      ? Text(
                                                                          "${documentData["caption"][i]}",
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                          style: blackTextFont.copyWith(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold),
                                                                        )
                                                                      : Column(
                                                                          children: [
                                                                            Text(
                                                                              "Oops, koinmu blm cukup...Baca Lebih Banyak Artikel (10 poin) ",
                                                                              textAlign: TextAlign.left,
                                                                              style: blackTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            RaisedButton(
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                                                color: mainColor,
                                                                                child: //ChildWidget1(),
                                                                                    Text("Artikel"),
                                                                                onPressed: () {
                                                                                  Navigator.push(
                                                                                      context,
                                                                                      MaterialPageRoute(
                                                                                          builder: (context) => MainPage(
                                                                                                bottomNavBarIndex: 1,
                                                                                              )));
                                                                                })
                                                                          ],
                                                                        ),
                                                                  SizedBox(
                                                                    height:
                                                                        defaultMargin,
                                                                  ),
                                                                  userState.user
                                                                              .balance >=
                                                                          total
                                                                      ? Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Image.network("${documentData["reward"][i]}", fit: BoxFit.cover),
                                                                          ),
                                                                        )
                                                                      : Container()
                                                                ],
                                                              ),
                                                            ),
                                                          ));
                                            });
                                      },
                                      child: Stack(children: [
                                        Container(
                                          height: 102,
                                          width: 102,
                                          child: Text('${i + 1}'),
                                          /*decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "${documentData["reward"][i]}"),
                                                ))*/
                                        ),
                                        Positioned(
                                            child: Container(
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                                child: Icon(
                                                    Icons.card_giftcard_sharp,
                                                    color: userState
                                                                .user.balance >=
                                                            total
                                                        ? Colors.blue
                                                        : Colors.grey,
                                                    size: 100)))
                                      ]))
                              ].toList()));
                    }
                    return SpinKitFadingCircle(
                      color: accentColor2,
                      size: 50,
                    );
                  }));
        } else {
          return SpinKitFadingCircle(
            color: mainColor,
            size: 50,
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    //getFollowers();
  }
}
//for (var i = 0; i < documentData["link"].length;i++)
//
// user.balance >= total
//     ? "Checkout Now"
//     : "Top Up My Wallet",
