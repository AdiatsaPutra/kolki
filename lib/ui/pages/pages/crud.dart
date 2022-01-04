part of 'pages.dart';

/*class CrudDiary extends StatefulWidget {
  //MyApp({Key key}) : super(key: key);
  @override
  _CrudDiaryState createState() => _CrudDiaryState();
}

class _CrudDiaryState extends State<CrudDiary> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  String studentName, studentID, studyProgramID;
  double studentGPA;
  var now = new DateTime.now();

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentID(id) {
    this.studentID = id;
  }

  getStudyProgramID(programID) {
    this.studyProgramID = programID;
  }

  getStudentGPA(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  createData() {
    print("Created");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyDiary").doc(studentName);
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };
    documentReference
        .set(students)
        .whenComplete(() => print("$studentName created"));
  }

  readData() {
    print("Read");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyDiary").doc(studentName);
    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data()["studentName"]);
      print(datasnapshot.data()["studentID"]);
      print(datasnapshot.data()["studyProgramID"]);
      print(datasnapshot.data()["studentGPA"]);
    });
  }

  updateData() {
    print("Update");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyDiary").doc(studentName);
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };
    documentReference
        .set(students)
        .whenComplete(() => print("$studentName updated"));
  }

  deleteData() {
    print("Delete");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyDiary").doc(studentName);
    documentReference
        .delete()
        .whenComplete(() => print("$studentName deleted"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            return Column(children: [
              TextField(
                  decoration: InputDecoration(
                      labelText: "Judul",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String name) {
                    getStudentName(name);
                  }),
              /*TextField(
                          decoration: InputDecoration(
                              labelText: "Bab",
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0))),
                          onChanged: (String id) {
                            getStudentID(id);
                          }),*/
              TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: "Apa yang Kamu Pelajari Hari ini?",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String programID) {
                    getStudyProgramID(programID);
                  }),
              TextField(
                  decoration: InputDecoration(
                      labelText: "Tanggal",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String gpa) {
                    getStudentGPA(gpa);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Create"),
                      textColor: Colors.white,
                      onPressed: () {
                        createData();
                      }),
                  RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Read"),
                      textColor: Colors.white,
                      onPressed: () {
                        readData();
                      }),
                  RaisedButton(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Update"),
                      textColor: Colors.white,
                      onPressed: () {
                        updateData();
                      }),
                  RaisedButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Delete"),
                      textColor: Colors.white,
                      onPressed: () {
                        deleteData();
                      }),
                ],
              ),
              Container(
                child: Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("MyDiary")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot documentSnapshot =
                                    snapshot.data.documents[index];
                                return Column(
                                  children: [
                                    TimelineTile(
                                        beforeLineStyle:
                                            LineStyle(color: Colors.blue),
                                        indicatorStyle: IndicatorStyle(
                                            indicatorXY: 0,
                                            width: 20.0,
                                            height: 20.0,
                                            padding: EdgeInsets.all(0)),
                                        hasIndicator: true,
                                        alignment: TimelineAlign.manual,
                                        lineXY: 0.2,
                                        isFirst: true,
                                        endChild: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, bottom: 8),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  documentSnapshot[
                                                      "studentName"],
                                                  maxLines: 1,
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(height: 2.0),

                                                /*Text(
                                                          documentSnapshot[
                                                                  "studentID"]
                                                              .toString(),
                                                          maxLines: 10,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontSize: 16.0),
                                                        ),*/
                                                GestureDetector(
                                                  child: Text(
                                                    documentSnapshot[
                                                            "studyProgramID"]
                                                        .toString(),
                                                    maxLines: 10,
                                                    overflow: TextOverflow.clip,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    PageDua()));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          // child: Text(DateFormat.yMMMd().format(DateTime.now())),
                                          constraints: const BoxConstraints(),
                                          color: Colors.transparent,
                                        ),
                                        startChild: Container(
                                            child: Column(
                                              children: [
                                                // Icon(Icons.home),
                                                Text("" + now.toString()),
                                                // Text(documentSnapshot["studentGPA"].toString(),
                                                //style: TextStyle(
                                                //    fontSize: 20.0),
                                                //)
                                              ],
                                            ),
                                            //  child: Text(DateFormat.yMMMd().format(DateTime.now())),
                                            color: Colors.transparent)),
                                    /*Row(children: [
                                              Expanded(
                                                child: Text(
                                                    documentSnapshot["studentName"]),
                                              ),
                                              Expanded(
                                                child: Text(
                                                    documentSnapshot["studentID"]
                                                        .toString()),
                                              ),
                                              Expanded(
                                                child: Text(
                                                    documentSnapshot["studyProgramID"]
                                                        .toString()),
                                              ),
                                              Expanded(
                                                child: Text(
                                                    documentSnapshot["studentGPA"]
                                                        .toString()),
                                              ),
                                              //  
                                            ]),*/
                                  ],
                                );
                              });
                        } else {
                          return Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
              )
            ]);
          }),
    );
  }
}
*/
