part of 'pages.dart';

class MoviePage extends StatelessWidget {
  var _today = new HijriCalendar.now();
  String locale = 'ar';

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          leading: Container(
            width: 26,
            height: 25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/kolki_logo_white.png"),
                    fit: BoxFit.cover)),
          ),
          actions: [
            /* DigitalClock(
              digitAnimationStyle: Curves.easeInOut,
              is24HourTimeFormat: true,
              areaHeight: 26,
              areaWidth: 110,
              areaAligment: AlignmentDirectional.centerEnd,
              areaDecoration: BoxDecoration(color: Colors.transparent),
            ),
            SizedBox(width: defaultMargin)*/
          ]),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          // note: HEADER
          Container(
            decoration: BoxDecoration(
                color: mainColor, //accentColor1,
                //gradient: LinearGradient(
                //  begin: Alignment(0, 0),
                //end: Alignment(0, 1),
                //colors: [accentColor1, Colors.white.withOpacity(0)]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2))),
            padding: EdgeInsets.fromLTRB(defaultMargin, 3.5, defaultMargin, 5),
            child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
              print("state:$userState dan state terakhir: $bloc.balance)");
              if (userState is UserLoaded) {
                if (imageFileToUpload != null) {
                  uploadImage(imageFileToUpload).then((downloadURL) {
                    imageFileToUpload = null;
                    context
                        .read<UserBloc>()
                        .add(UpdateData(profileImage: downloadURL));
                  });
                }

                return Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        SpinKitFadingCircle(
                          color: accentColor2,
                          size: 28,
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (userState.user.profilePicture == ""
                                      ? AssetImage("assets/user_pic.png")
                                      : NetworkImage(
                                          userState.user.profilePicture)),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2 -
                                2 * defaultMargin -
                                32,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyReward()));
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Poin((userState is UserLoaded)
                                        ? userState.user.balance
                                        : null),
                                    /*Text(
                                      NumberFormat.currency(
                                              locale: "id_ID",
                                              decimalDigits: 0,
                                              symbol: "koin bacaku ")
                                          .format(userState.user.balance),
                                      style: yellowNumberFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),*/
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    userState.user.name,
                                    style: whiteTextFont.copyWith(fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2 -
                                  2 * defaultMargin,
                              child: Column(children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(_today.toFormat('yyyy/MM/dd'),
                                      style: yellowNumberFont.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.end),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      DateFormat('EEE, yyyy/MMMM/dd')
                                          .format(DateTime.now()),
                                      style: yellowNumberFont.copyWith(
                                          color: Colors.white, fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.end),
                                )
                              ]))
                        ]),
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: accentColor2,
                  size: 50,
                );
              }
            }),
          ),
          Column(
            children: [
              SizedBox(height: 12),
              Container(
                padding:
                    EdgeInsets.only(left: defaultMargin, right: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 35,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text("LIVE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      width: 45,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text("KIDS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      width: 45,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text("TEENS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      width: 45,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text("GOLD",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          /*SingleChildScrollView(
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
            ]),*/
          Divider(),
          JadwalSholat(),
          Divider(),
          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 12),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyNote()));
                  },
                  icon: Icon(MdiIcons.weatherRainy),
                ),
                Container(
                  width: 280,
                  child: Text(
                    "Apa yang sudah kupelajari hari ini?",
                    style: blackTextFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          Stack(children: [SavedTab()]),
          Divider(),
          // note: BROWSE MOVIE
          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 12),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HistoryNav()));
                  },
                  icon: Icon(Icons.local_florist_outlined),
                ),
                Container(
                  width: 280,
                  child: Text(
                    "Apa yang sudah kukerjakan hari ini?",
                    style: blackTextFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          CartTab(),

          BlocBuilder<UserBloc, UserState>(
            //pakai blocbuilder karena yg dipilihnya ada di data user
            builder: (_, userState) {
              if (userState is UserLoaded) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 0, defaultMargin, 12),
                      child: Row(
                        children: [
                          Text(
                            "Ingatlah hari ini...",
                            style: blackTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          /*Text(
                            "${DateFormat("EEEE,dd MMMM, yyyy").format(event.creationTime)}",
                            style: blackTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),*/
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            userState.user.selectedGenres.length,
                            (index) => BrowseButton(
                                userState.user.selectedGenres[index])),
                      ),
                    ),
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),

          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
            child: Text(
              "Investasi Akhirat",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
            child: Text(
              "Kajian",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
              child: Text(
                "Radio",
                style: blackTextFont.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
            child: Text(
              "Muatan Lokal",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}

class Poin extends StatelessWidget {
  final int number;
  Poin(
    this.number,
  );

  @override
  Widget build(BuildContext context) {
    return Text(number != null ? 'Poinku $number' : "-",
        style: yellowNumberFont.copyWith(
            fontSize: 15, fontWeight: FontWeight.bold));
  }
}
