part of 'pages.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<NoteProvider>(context, listen: false).getNotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
                top: false,
                child: Scaffold(
                  body: Consumer<NoteProvider>(
                    child: noNotesUI(context),
                    builder: (context, noteprovider, child) => noteprovider
                                .items.length <=
                            0
                        ? child
                        : Consumer<NoteProvider>(
                            child: noNotesUI(context),
                            builder: (context, noteprovider, child) =>
                                noteprovider.items.length <= 0
                                    ? child
                                    : ListView.builder(
                                        itemCount:
                                            noteprovider.items.length + 1,
                                        itemBuilder: (context, index) {
                                          if (index == 0) {
                                            return Container(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 55),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          defaultMargin,
                                                          0,
                                                          defaultMargin,
                                                          defaultMargin),
                                                  width: 320,
                                                  child: Text(
                                                    "Dari 'Abdullah bin 'Amr dan Anas bin Malik radhiyallahu 'anhuma,\nRasulullah shallallahu 'alaihi wa sallam bersabda,\n'Jagalah ilmu dengan menulis.' (Shahih Al-Jami', no 4434. Syaikh Al-Albani mengatakan bahwa hadits ini sahih).",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        greyTextFont.copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  ),
                                                ),
                                              ],
                                            )); //header();
                                          } else {
                                            final i = index - 1;
                                            final item = noteprovider.items[i];
                                            return ListItem(
                                              id: item.id,
                                              title: item.title,
                                              content: item.content,
                                              imagePath: item.imagePath,
                                              date: item.date,
                                            );
                                          }
                                        },
                                      ),
                          ),
                  ),
                  floatingActionButton: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        backgroundColor: mainColor,
                        onPressed: () {
                          goToNoteEditScreen(context);
                        },
                        child: Icon(Icons.add),
                      ),
                      SizedBox(height: 33)
                    ],
                  ),
                ));
          }
          return Container(
            width: 0.0,
            height: 0.0,
          );
        }
      },
    );
  }

  Widget header() {
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
        decoration: BoxDecoration(
          color: headerColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(75.0),
          ),
        ),
        height: 150,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ANDROIDRIDE\'S',
              style: headerRideStyle,
            ),
            Text(
              'NOTES',
              style: headerNotesStyle,
            ),
          ],
        ),
      ),
    );
  }

  _launchUrl() async {
    const url = 'https://www.androidride.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget noNotesUI(BuildContext context) {
    return ListView(
      children: [
        //header(),
        Column(
          children: [
            Text(
              "Dari 'Abdullah bin 'Amr dan Anas bin Malik radhiyallahu 'anhuma,\nRasulullah shallallahu 'alaihi wa sallam bersabda,\n'Jagalah ilmu dengan menulis.' (Shahih Al-Jami', no 4434. Syaikh Al-Albani mengatakan bahwa hadits ini sahih).",
              textAlign: TextAlign.center,
              style: greyTextFont.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: defaultMargin),
            Text(
              'Belum ada catatan. \nTekan tombol + di bawah untuk menambah catatan',
              textAlign: TextAlign.center,
              style: blackTextFont.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    );
  }

  void goToNoteEditScreen(BuildContext context) {
    Navigator.of(context).pushNamed(NoteEditScreen.route);
  }
}
