part of 'pages.dart';

class TodoByCategory extends StatefulWidget {
  final String category;

  TodoByCategory({Key key, this.category}) : super(key: key);

  @override
  _TodoByCategoryState createState() => _TodoByCategoryState();
}

class _TodoByCategoryState extends State<TodoByCategory> {
  List<Todo> _todoList = List<Todo>();
  TodoService _todoService = TodoService();
//<object>
  //String exportfilename = "pdf";
  @override
  void initState() {
    super.initState();
    getTodosByCategories();
  }

  getTodosByCategories() async {
    var todos = await _todoService.readTodosByCategory(this.widget.category);
    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.title = todo['title'];
        model.description = todo['description'];
        model.todoDate = todo['todoDate'];
        _todoList.add(model);
      });
    });
  }

  final _screenshotController = ScreenshotController();
  void _takeScreenshot() async {
    final imageFile = await _screenshotController.capture();
    Share.shareFiles([imageFile.path], text: "${widget.category}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category),
          backgroundColor: mainColor,
          actions: [
            IconButton(
                icon: Icon(Icons.file_copy_rounded, color: Colors.white),
                onPressed: _takeScreenshot
                //reportView(HeaderListData,Formdata,MappingData,ExtFilenameasString,exportfilename);//
                //() async {final pdfFile = await PdfApi.generateTable();PdfApi.openFile(pdfFile);},
                )
          ],
        ),
        body: Screenshot(
            controller: _screenshotController,
            child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                      if (userState is UserLoaded) {
                        if (imageFileToUpload != null) {
                          uploadImage(imageFileToUpload).then((downloadURL) {
                            imageFileToUpload = null;
                            context
                                .bloc<UserBloc>()
                                .add(UpdateData(profileImage: downloadURL));
                          });
                        }
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(
                                defaultMargin, defaultMargin, defaultMargin, 0),
                            child: Row(children: [
                              Text(widget.category, style: blackTextFont),
                              Text(" oleh ", style: greyTextFont),
                              Text(userState.user.name, style: greyTextFont),
                            ]));
                      }
                    }),
                    SizedBox(height: defaultMargin),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          defaultMargin, 0, defaultMargin, 0),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(4),
                          2: FlexColumnWidth(4),
                          3: FlexColumnWidth(3)
                        },
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            Text(
                              "No",
                              textAlign: TextAlign.center,
                            ),
                            Text("Judul Amal",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text("Deskripsi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text("Tanggal",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ])
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _todoList.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    defaultMargin, 0, defaultMargin, 0),
                                child: Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(1),
                                    1: FlexColumnWidth(4),
                                    2: FlexColumnWidth(4),
                                    3: FlexColumnWidth(3)
                                  },
                                  border: TableBorder.all(),
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        "${index + 1}",
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(_todoList[index].title ?? "no title",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                      Text(
                                          _todoList[index].description ??
                                              "no description",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15)),
                                      Text(
                                        _todoList[index].todoDate ?? "no date",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ])
                                  ],
                                ))
                          ]);
                        },
                      ),
                    )
                  ],
                ))),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: mainColor,
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (_, __, ___) => CalendarPage2()));
              },
              child: Icon(Icons.calendar_today_rounded),
            ),
            SizedBox(height: 33)
          ],
        ));
  }
}
