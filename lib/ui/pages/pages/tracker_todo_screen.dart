part of 'pages.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
 
  var _todoTitleController = TextEditingController();

  var _todoDescriptionController = TextEditingController();

  var _todoDateController = TextEditingController();

  var _selectedValue;

  var _categories = List<DropdownMenuItem>();

  DateTime _dateTime = DateTime.now();

  _selectedTodoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      currentDate: DateTime.now(),
      initialDate: _dateTime,
      firstDate: DateTime.now(), // DateTime(2020),
      lastDate: DateTime.now(),
      // selectableDayPredicate: false
    ); //DateTime(2100));

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _todoDateController.text = DateFormat("dd/MM/yy").format(_pickedDate);
      });
    }
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  _showSuccessSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    _globalKey.currentState.showSnackBar(_snackBar);
  }

  @override
  void initState() {
    super.initState();
    _loadCatagories();
    }

  _loadCatagories() async {
    var _categoryService = CategoryService();
    var categories = await _categoryService.readCategories();
    categories.forEach((category) {
      setState(() {
        _categories.add(DropdownMenuItem(
          child: Text(category['name']),
          value: category['name'],
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("Tulis Amalmu"),
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: defaultMargin, right: defaultMargin),
        child: ListView(
            shrinkWrap: true,
            children: [
              DropdownButtonFormField(
                value: _selectedValue,
                items: _categories,
                hint: Text("Kategori"),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _todoTitleController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Judul Amal",
                    hintText: "co:AnNas"),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                maxLines: 3,
                controller: _todoDescriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Keterangan Amal",
                    hintText: "jumlah atau kendala. \nco:4 baris dan 3x salah"),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                showCursor: false,
                controller: _todoDateController,
                readOnly: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Tanggal Amal",
                    prefix: InkWell(
                      onTap: () {
                        _selectedTodoDate(context);
                      },
                      child: Icon(
                        Icons.calendar_today_outlined,
                        size: 24,
                      ),
                    )),
              ),
              SizedBox(
                height: 16,
              ),
            ].toList()),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: mainColor,
            onPressed: () async {
              var todoObject = Todo();
              todoObject.title = _todoTitleController.text;
              todoObject.description = _todoDescriptionController.text;

              todoObject.category = _selectedValue.toString();
              todoObject.isFinished = 0;
              todoObject.todoDate = _todoDateController.text;

              var _todoService = TodoService();

              var result = await _todoService.saveTodo(todoObject);
             
              //if (result > 0) {_showSuccessSnackBar(Text("amal hari ini telah ditambahkan"));}
              Navigator.pop(context);
              print(result);
            },
            child: Icon(Icons.save),
          ),
          SizedBox(height: 33)
        ],
      ),
    );
  }
}
