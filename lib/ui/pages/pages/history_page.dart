part of 'pages.dart';

class HistoryPage extends StatelessWidget {
  int selectedPage;
  HistoryPage(this.selectedPage);
  @override
  Widget build(BuildContext context) {
    //sumberilmu
    //final _kTabPages = <Widget>[SumberIlmu(), Artikel()]; //HistoryNav()];
    //  final _kTabs = <Tab>[      Tab(text: 'Ilmu'),      Tab(text: 'Artikel'),    ];
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: selectedPage,
        length: 2, //_kTabs.length,
        child: BlocBuilder<PoinBloc, PoinState>(
            builder: (_, state) => Scaffold(
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
                          context.read<PoinBloc>().add(Incrementt());
                        },
                      ),
                      PopupMenuButton<int>(
                          onSelected: (item) => onSelected(context, item),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 0,
                                  child: Row(
                                    children: [
                                      Icon(Icons.share_outlined,
                                          color: Colors.black),
                                      Text('  Share'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 1,
                                  child: Row(
                                    children: [
                                      Icon(Icons.star_outline,
                                          color: Colors.black, size: 30),
                                      Text('  Rate'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 2,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.mail_outline,
                                        color: Colors.black,
                                      ),
                                      Text('  Kritik Saran'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 3,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.call_outlined,
                                        color: Colors.black,
                                      ),
                                      Text('  Kritik Saran'),
                                    ],
                                  ),
                                ),
                                PopupMenuDivider(),
                                PopupMenuItem(
                                  value: 4,
                                  child: Row(
                                    children: [
                                      Icon(Icons.logout, color: Colors.black),
                                      Text('  LogOut'),
                                    ],
                                  ),
                                )
                              ]),
                    ],
                    elevation:
                        0, //BlocBuilder<PoinBloc, PoinState>(builder:(_,state)=>
                    title: Text('Jelajah',
                        style: whiteTextFont.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight
                                .bold)), //Cuman((state is PoinValue) ? state.value : null),
                    backgroundColor: mainColor,
                    // If TabController controller is not provided, then a
                    //FileSystemException: Cannot copy file to 'build\f872507f30e2ff2523f0f1d19160266e.cache.dill.track.dill', path = 'C:\Users\ASUS\AppData\Local\Temp\flutter_tools.406dac21\flutter_tool.ab3075d\app.dill' (OS Error: The process cannot access the file because it is being used by another process.
                    // DefaultTabController ancestor must be provided instead.
                    // Another way is to use a self-defined controller, c.f. "Bottom tab
                    // bar" example.
                    bottom: TabBar(
                        indicatorColor: accentColor2,
                        indicatorWeight: 4.0,
                        tabs: [
                          Tab(text: 'Ilmu'),
                          Tab(text: 'Artikel'),
                        ] //_kTabs,
                        ),
                  ),
                  body: TabBarView(
                      children: [SumberIlmu(), Artikel()] //_kTabPages,
                      ),
                )),
      ),
    );
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;

      case 2:
        Utils.openEmail(
          toEmail: 'kolkisunnah@gmail.com',
          subject: 'Kritik Saran',
          body: 'This works great!',
        );
        break;
      case 3:
        Utils.openPhoneCall(phoneNumber: '+6281221085550');
        break;
      case 4:
        AuthServices.signOut();
        context.bloc<UserBloc>().add(SignOut());

        break;
    }
  }
}

class Cuman extends StatelessWidget {
  final int number;
  Cuman(
    this.number,
  );

  @override
  Widget build(BuildContext context) {
    return Text(number != null ? '$number' : "-",
        style:
            whiteTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold));
  }
}
