part of 'widgets.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  FirebaseServices _firebaseServices = FirebaseServices();
  String searchString = "";
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: TextField(
          onSubmitted: (value) {
            setState(() {
              searchString = value.toLowerCase();
            });
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Cari Buku",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              )),
        ),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.barcodeScan),
            onPressed: scanLangsung,
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            if (barcode.isEmpty)
              Center(
                child: Container(
                  child: Text(
                    "Pencarian",
                    style: Constants.regularDarkText,
                  ),
                ),
              )
            else
              FutureBuilder<QuerySnapshot>(
                future: _firebaseServices.productsRef
                    .where("search_string", arrayContains: barcode)
                    .get(), // .orderBy("search_string").startAt([barcode]).endAt(["$barcode\uf8ff"]).get(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text("Error: ${snapshot.error}"),
                      ),
                    );
                  }

                  // Collection Data ready to display
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Display the data inside a list view
                    return ListView(
                      padding: EdgeInsets.only(
                        top: 128.0,
                        bottom: 12.0,
                      ),
                      children: snapshot.data.docs.map((document) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ProductCard(
                                judulBuku: document.data()['judulBuku'],
                                gambar: document.data()['gambar'][0],
                                pelajar: "${document.data()['pelajar']}",
                                productId: document.id,
                                deprecated: "${document.data()['deprecated']}",
                                harga: "${document.data()['harga']}",
                              ),
                              //  ProductCard(judulBuku: document.data()['judulAmal'],gambar: document.data()['gambar'][0],pelajar: "${document.data()['pelajar']}",productId: document.id,)
                            ]);
                      }).toList(),
                    );
                  }

                  // Loading State
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            if (searchString.isEmpty)
              Center(
                child: Container(
                  child: Text(
                    "Pencarian",
                    style: Constants.regularDarkText,
                  ),
                ),
              )
            else
              FutureBuilder<QuerySnapshot>(
                future: _firebaseServices.productsRef
                    .where("search_string", arrayContains: searchString)
                    .get(), //.orderBy("search_string").startAt([barcode]).endAt(["$barcode\uf8ff"]).get(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text("Error: ${snapshot.error}"),
                      ),
                    );
                  }

                  // Collection Data ready to display
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Display the data inside a list view
                    return ListView(
                      padding: EdgeInsets.only(
                        top: 128.0,
                        bottom: 12.0,
                      ),
                      children: snapshot.data.docs.map((document) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ProductCard(
                                judulBuku: document.data()['judulBuku'],
                                gambar: document.data()['gambar'][0],
                                pelajar: "${document.data()['pelajar']}",
                                productId: document.id,
                                deprecated: "${document.data()['deprecated']}",
                                harga: "${document.data()['harga']}",
                              ),
                              //  ProductCard(judulBuku: document.data()['judulAmal'],gambar: document.data()['gambar'][0],pelajar: "${document.data()['pelajar']}",productId: document.id,)
                            ]);
                      }).toList(),
                    );
                  }

                  // Loading State
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            /* Padding(
                          padding: const EdgeInsets.only(
                            top: 45.0,
                          ),
                          child: CustomInput(
                            hintText: "Cari Buku",
                            onSubmitted: (value) {
                              setState(() {
                                _searchString = value.toLowerCase();
                              });
                            },
                          ),
                        ),*/
          ],
        ),
      ),
    );
  }

  Future<void> scanLangsung() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
      if (!mounted) return;
      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException {
      barcode = 'uhuy';
    }
  }
}
