part of 'widgets.dart';

class CartTab extends StatelessWidget {
  final FirebaseServices _firebaseServices = FirebaseServices();
/* Future _addToDone() {
    return _firebaseServices.usersCollection
        .doc(_firebaseServices.getUserId())
        .collection("Done")
        .doc(widget.productId)
        .set({"materi": _selectedMateri});
  }
*/
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      height: 240,
      width: 360,
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _firebaseServices.usersCollection
                .doc(_firebaseServices.getUserId())
                .collection("Cart")
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
                return Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: snapshot.data.docs.map((document) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AmalDetailPage(
                                productId: document.id,
                              ),
                            ));
                      },
                      child: FutureBuilder(
                        future:
                            _firebaseServices.hatiRef.doc(document.id).get(),
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
                                  ListTile(
                                    contentPadding: EdgeInsets.only(
                                        left: 0.0,
                                        right: 12.0,
                                        top: 0.0,
                                        bottom: 0.0),
                                    dense: false,
                                    leading: Container(
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "${_productMap["gambar"][0]}"),
                                          )),
                                    ),
                                    title: Align(
                                      alignment: Alignment(-1.2, 0),
                                      child: Text(
                                        "${_productMap["judulAmal"]}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: blackTextFont.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    subtitle: Align(
                                      alignment: Alignment(-1.17, 0),
                                      child: Text(
                                        "${document.data()["deskripsi"]}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    trailing:
                                        Text("", // "${_productMap["pelajar"]}",
                                            style: greyTextFont),
                                  ),
                                  Divider(indent: 80),
                                ],
                              ),
                            );
                          }

                          return Container(
                            child: Center(
                                // child: CircularProgressIndicator(),
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
                    child: SpinKitFadingCircle(
                  color: accentColor2,
                  size: 50,
                )),
              );
            },
          ),
          // CustomActionBar(title: "Saved",hasBackArrrow: false,),
        ],
      ),
    );
  }
}
