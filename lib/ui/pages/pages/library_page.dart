part of 'pages.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      MyIlmuPage(), MyAmalPage() //Cobaya()
    ];
    final _kTabs = <Tab>[
      Tab(
          //icon: Icon(Icons.cloud),
          text: 'Ilmu'),
      Tab(
          //icon: Icon(Icons.alarm),
          text: 'Amal'),
    ];
    return MaterialApp(
      home: DefaultTabController(
        length: _kTabs.length,
        child: Scaffold(
          appBar: AppBar(
            leading: Container(
              width: 26,
              height: 25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/kolki_logo_white.png"),
                      fit: BoxFit.cover)),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchTab()));
                },
              ),
              PopupMenuButton<int>(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 0,
                          child: Row(
                            children: [
                              Icon(Icons.book_outlined, color: Colors.black),
                              Text('  Belajar'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: [
                              Icon(Icons.shopping_cart_outlined,
                                  color: Colors.black, size: 30),
                              Text('  Belanja'),
                            ],
                          ),
                        ),
                      ]),
            ],
            elevation: 0,
            title: Text('Temukan',
                style: whiteTextFont.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            backgroundColor: mainColor,
            // If TabController controller is not provided, then a
            // DefaultTabController ancestor must be provided instead.
            // Another way is to use a self-defined controller, c.f. "Bottom tab
            // bar" example.
            bottom: TabBar(
              indicatorColor: accentColor2,
              indicatorWeight: 4.0,
              tabs: _kTabs,
            ),
          ),
          body: TabBarView(
            children: _kTabPages,
          ),
        ),
      ),
    );
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }
}
