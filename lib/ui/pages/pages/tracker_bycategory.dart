part of 'pages.dart';

class ByCategory extends StatefulWidget {
  final String category;

  ByCategory({Key key, this.category}) : super(key: key);

  @override
  _ByCategoryState createState() => _ByCategoryState();
}

class _ByCategoryState extends State<ByCategory> {
  List<Todo> _todoList = List<Todo>();
  TodoService _todoService = TodoService();
//<object>
//
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category),
          backgroundColor: mainColor,
        ),
        body: Column(
          children: [
            SizedBox(height: defaultMargin),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
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
                          border: TableBorder.all(),
                          children: [
                            TableRow(children: [
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
        ),
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
