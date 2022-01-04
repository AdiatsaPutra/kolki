part of 'pages.dart';

class HomesScreen extends StatefulWidget {
  @override
  _HomesScreenState createState() => _HomesScreenState();
}

class _HomesScreenState extends State<HomesScreen> {
  TodoService _todoService;
  void goToNoteEditScreen(BuildContext context) {
    Navigator.of(context).pushNamed(NoteEditScreen.route);
  }

  List<Todo> _todoList = List<Todo>();

  @override
  initState() {
    super.initState();
    getAllTodos();
  }

  getAllTodos() async {
    _todoService = TodoService();
    _todoList = List<Todo>();
    var todos = await _todoService.readTodos();
    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.id = todo['id'];
        model.title = todo['title'];
        model.description = todo['description'];
        model.category = todo['category'];
        model.todoDate = todo['todoDate'];
        model.isFinished = todo['isFinished'];
        _todoList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Semangat beramal"), backgroundColor: mainColor),
      body: Column(
        children: [
          SizedBox(
            height: defaultMargin,
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
            child: Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  Text("Judul Amal",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text("Kategori",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text("Tanggal",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                            Text(_todoList[index].title ?? "tidak berjudul",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text(
                                _todoList[index].category ??
                                    "tidak ada kategori",
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
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => TodoScreen()))
                .whenComplete(() => getAllTodos()),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 33)
        ],
      ),
    );
  }
}
