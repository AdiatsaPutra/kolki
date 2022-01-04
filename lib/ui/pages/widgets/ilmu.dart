part of 'widgets.dart';

class IlmuTab extends StatelessWidget {
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 360,
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _firebaseServices.productsRef
                .doc('sekolah')
                .collection("Saved")
                .get(),
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
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(0
                      //  top: 108.0,
                      // bottom: 12.0,
                      ),
                  children: snapshot.data.docs.map((document) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IlmuDetailPage(
                                productId: document.id,
                              ),
                            ));
                      },
                      child: FutureBuilder(
                        future: _firebaseServices.productsRef
                            .doc(document.id)
                            .get(),
                        builder: (context, productSnap) {
                          if (productSnap.hasError) {
                            return Container(
                              child: Center(
                                child: Text("${productSnap.error}"),
                              ),
                            );
                          }

                          if (productSnap.connectionState ==
                              ConnectionState.done) {
                            Map _productMap = productSnap.data.data();

                            return Padding(
                              padding: const EdgeInsets.all(0
                                  //  vertical: 16.0,
                                  //horizontal: 24.0,
                                  ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    //color: Colors.pink,
                                    width: 80,
                                    height: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        "${_productMap['gambar'][0]}",
                                        //  " ${document.data()['gambar'][0]}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 16.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_productMap['judulBuku']}",
                                          //
                                          // "${document.data()['judulBuku']}",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                          ),
                                          child: Text(
                                            // "\$${_productMap['pelajar']}",
                                            " ${document.data()['pelajar']}",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Text(
                                          "", //  "Size - ${document.data()['materi']}",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                    );
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
          // CustomActionBar(title: "Saved",hasBackArrrow: false,),
        ],
      ),
    );
  }
}
