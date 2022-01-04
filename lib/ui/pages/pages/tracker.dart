part of 'pages.dart';

//import 'package:slide_digital_clock/slide_digital_clock.dart';
class HistoryNav extends StatefulWidget {
  @override
  _HistoryNavState createState() => _HistoryNavState();
}

class _HistoryNavState extends State<HistoryNav> {
  List<Widget> _categoryList = List<Widget>();
  CategoryService _categoryService = CategoryService();

  @override
  initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _categoryService.readCategories();

    categories.forEach((category) {
      setState(() {
        _categoryList.add(InkWell(
          onTap: () {
            Navigator.push(
                this.context,
                MaterialPageRoute(
                    builder: (context) => TodoByCategory(
                          category: category['name'],
                        )));
          },
          child: ListTile(
            title: Text(category['name']),
          ),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Riwayat Amalku"),
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(
                defaultMargin, 0, defaultMargin, defaultMargin),
            child: Text(
              "Dari ’Aisyah –radhiyallahu ’anha-, \n Rasulullah shallallahu ’alaihi wa sallam bersabda,\n أَحَبُّ الأَعْمَالِ إِلَى اللَّهِ تَعَالَى أَدْوَمُهَا وَإِنْ قَلَّ \n”Amalan yang paling dicintai oleh Allah Ta’ala \n adalah amalan yang kontinu walaupun itu sedikit.”(HR. Muslim no. 783)",
              textAlign: TextAlign.center,
              style: greyTextFont.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  defaultMargin, 0, defaultMargin, defaultMargin),
              child: Card(
                child: ListTile(
                    title: Text("Kategori"),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => CategoriesScreen()))
                          .whenComplete(() => getAllCategories);
                    }),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                defaultMargin, 0, defaultMargin, defaultMargin),
            child: Card(
              child: ListTile(
                  title: Text("Note Amal"),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomesScreen()));
                  }),
            ),
          ),
          Divider(),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
            child: Column(
              children: _categoryList,
            ),
          ),
          Divider(),
          Container(
            margin: const EdgeInsets.fromLTRB(
                defaultMargin, 0, defaultMargin, defaultMargin),
            child: Text(
              "Dari Sahl bin Sa'ad As-Sa'idi radhiyallahu 'anhuma,\n Rasulullah shallallahu 'alaihi wa sallam bersabda,\n وَإِنَّمَا الأَعْمَالُ بِالْخَوَاتِيمِ \n”Sesungguhnya setiap amalan tergantung pada akhirnya.” (HR.Bukhari, no 6607).",
              textAlign: TextAlign.center,
              style: greyTextFont.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ),
        ])),
      ),
    );
  }
}
