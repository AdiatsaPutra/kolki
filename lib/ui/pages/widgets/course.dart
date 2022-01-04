part of 'widgets.dart';

class Course extends StatelessWidget {
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245,
      width: 360,
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future:
                _firebaseServices.productsRef.doc().collection("course").get(),
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
                  padding: EdgeInsets.only(left: defaultMargin
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
                              padding: const EdgeInsets.only(right: 12),
                              child: Text(
                                "${_productMap['donasi'][0]}",
                                //  " ${document.data()['gambar'][0]}",
                              ),
                            );
                          }

                          return Column(
                            children: [
                              Container(
                                  width: 102,
                                  height: 158,
                                  decoration: BoxDecoration(
                                      color: Colors.teal[100],
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/kolki_logo.png"),
                                          fit: BoxFit.fitWidth))),
                              SizedBox(height: 2),
                              Container(
                                  width: 102,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.teal[200],
                                  )),
                              SizedBox(height: 2),
                              Container(
                                  width: 102,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.teal[100],
                                  ))
                            ],
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
                  child: Container(
                      width: 360 - 2 * defaultMargin,
                      height: 245,
                      decoration: BoxDecoration(
                          color: Colors.teal[100],
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage("assets/kolki_logo.png"),
                              fit: BoxFit.fitWidth))),
                ),
              );
            },
          ),
          // CustomActionBar(title: "Saved",hasBackArrrow: false,),
        ],
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
        break;
    }
  }
}
