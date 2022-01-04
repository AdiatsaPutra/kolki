part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  MainPage({this.bottomNavBarIndex = 0});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          /* Container(
            color: Colors.cyan,
          ),
        SafeArea(
              child: Container(
            color: Color(0xFFF6F7F9),
          )),*/
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: <Widget>[MoviePage(), HistoryPage(1)],
          ),
          createCustomBottomNavBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 46,
              width: 46,
              margin: EdgeInsets.only(bottom: 12),
              child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: accentColor2,
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: Icon(
                      MdiIcons.bookshelf,
                      color: Colors.black.withOpacity(0.54),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LibraryPage()));

                    //auth.FirebaseAuth.instance.signOut();
                    //Provider.of<UserBloc>(context, listen: false);

                    // context.watch<UserBloc>().add(SignOut());
                    //AuthServices.signOut();
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: mainColor,
                unselectedItemColor: Color(0xFFE5E5E5),
                currentIndex: bottomNavBarIndex,
                onTap: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
                    pageController.jumpToPage(index);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      title: Text("Beranda",
                          style: GoogleFonts.raleway(
                              fontSize: 8, fontWeight: FontWeight.w600)),
                      icon: Container(
                          margin: EdgeInsets.only(bottom: 6),
                          height: 10,
                          child: Icon(
                            (bottomNavBarIndex == 0) ? Icons.home : Icons.home,
                            size: 18,
                          ))
                      /* child: Image.asset((bottomNavBarIndex == 0)
                            ? "assets/ic_movie.png"
                            : "assets/ic_movie_grey.png"),
                      )
                      */
                      ),
                  BottomNavigationBarItem(
                      title: Text("Jelajah",
                          style: GoogleFonts.raleway(
                              fontSize: 8, fontWeight: FontWeight.w600)),
                      icon: Container(
                          margin: EdgeInsets.only(bottom: 6),
                          height: 10,
                          child: Icon(
                            (bottomNavBarIndex == 1)
                                ? Icons.history
                                : Icons.history,
                            size: 18,
                          )))
                ]),
          ),
        ),
      );
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
