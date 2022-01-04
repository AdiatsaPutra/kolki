part of 'pages.dart';

class Userss {
  final String gender;

  final String nama;
  final int umur;

  Userss({@required this.nama, @required this.umur, @required this.gender});
}

class PdfApi {
  static String category;

  static Future<File> generateCenteredText(
      String a, String b, String c, String d) async {
    final rnd = math.Random(42);
    //pw.Text(text)
    Note selectedNote;
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
        theme: pw.ThemeData.withFont(
            base: pw.Font.ttf(await rootBundle
                .load("assets/Scheherazade-Regular.ttf"))), //Scheherazade
        // build: (pw.Context context) => [
        // pw.Padding(
        //  padding: pw.EdgeInsets.fromLTRB(40.0, 30.0, 30.0, 0.0),
        // child:
        //  pageFormat: const PdfPageFormat(200, 200),
        margin: pw.EdgeInsets.fromLTRB(40.0, 30.0, 30.0, 40.0),
        build: (pw.Context context) => <pw.Widget>[
              pw.Wrap(
                  direction: pw.Axis.vertical,
                  verticalDirection: pw.VerticalDirection.up,
                  alignment: pw.WrapAlignment.center,
                  runAlignment: pw.WrapAlignment.center,
                  crossAxisAlignment: pw.WrapCrossAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: List<pw.Widget>.generate(
                      1,
                      (int n) => pw.Container(
                          // color:Colors.pink,

                          width: 500, //rnd.nextDouble() * 100,
                          height: 800, //rnd.nextDouble() * 100,
                          alignment: pw.Alignment.topLeft,
                          //  color: PdfColors.blue800,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(a,
                                    textAlign: pw.TextAlign.justify,
                                    style: pw.TextStyle(
                                        fontSize: 14,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Text("\n"),
                                pw.Row(children: [
                                  pw.Text(c),
                                  pw.Text(" oleh "),
                                  pw.Text(b),
                                ]),
                                pw.Text("\n"),
                                pw.Wrap(
                                    direction: pw.Axis.vertical,
                                    verticalDirection: pw.VerticalDirection.up,
                                    alignment: pw.WrapAlignment.center,
                                    runAlignment: pw.WrapAlignment.center,
                                    crossAxisAlignment:
                                        pw.WrapCrossAlignment.center,
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: List<pw.Widget>.generate(
                                        1,
                                        (int n) => pw.Container(
                                            width:
                                                500, //rnd.nextDouble() * 100,
                                            height:
                                                700, //rnd.nextDouble() * 100,
                                            alignment: pw.Alignment.topLeft,
                                            //   color: pw.PdfColors.blue800,
                                            child: pw.Paragraph(
                                              text: d,
                                              //   textAlign: pw.TextAlign.justify,
                                            ))))
                              ]))))
            ]));

    return saveDocument(name: 'Catatanku.pdf', pdf: pdf);
  }

//  static Future<File> generate() async {}

  static Future<File> saveDocument({
    @required String name,
    @required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  static Future<File> generateTable() async {
    List<Todo> _todoList = List<Todo>();
    TodoService _todoService = TodoService();
    final pdf = pw.Document();
    final headers = ['Judul Amal', 'Deskripsi', 'Tanggal'];
    final userss = [
      Userss(nama: 'jam', umur: 3, gender: 'p'),
      Userss(nama: 'jam', umur: 3, gender: 'p')
    ];
//List<List<String>> _todoList(){return _todoList.map((todo))}
    final data = userss
        .map((userss) => [userss.nama, userss.umur, userss.gender])
        .toList();
    // List<List<String>> data = List();

    // data.add(<String>[ '{_todoList.title}', '{_todoList.description}', '{_todoList.todoDate}',]).toList();

    for (var i = 0; i < _todoList.length; i++) {
      List<String> uu = <String>[
        _todoList[i].title,
        _todoList[i].description,
        _todoList[i].todoDate,
      ];
      data.add(uu);
    }
    // .map((userss) => [userss.nama, userss.umur, userss.gender])
    //.toList();
    /* final data = _todoList
        .map((_todoList) => [
              '${_todoList.title}',
              '${_todoList.description}',
              '${_todoList.todoDate}'
            ])
        .toList();*/

    pdf.addPage(pw.MultiPage(
        // theme: pw.ThemeData.withFont(  base: pw.Font.ttf( await rootBundle.load("assets/Scheherazade-Regular.ttf"))),
        build: (pw.Context context) => [
              pw.Table.fromTextArray(
                  context: context,
                  headers: headers,
                  data: <List<String>>[
                    <String>["a", "b", "c"],
                    for (int i = 0; i < _todoList.length; i++)
                      <String>[
                        '${i + 1}) ${_todoList.elementAt(i).title}',
                        '${_todoList.elementAt(i).description}',
                        '${_todoList.elementAt(i).todoDate}'
                      ],
                  ])
            ]));

    // pw.Table.fromTextArray(headers: headers, data: data)));

    return saveDocument(name: 'Amalanku.pdf', pdf: pdf);
  }
}
