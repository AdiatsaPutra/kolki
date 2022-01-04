part of 'pages.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _categoryDateController = TextEditingController();
  var _category = CategoryTodo();
  var _categoryService = CategoryService();

  List<CategoryTodo> _categoryList = List<CategoryTodo>();

  var _editCategoryNameController = TextEditingController();
  var _editCategoryDescriptionController = TextEditingController();

  var category;

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
        _categoryDateController.text =
            DateFormat("dd/MM/yy").format(_pickedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCatagories();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  getAllCatagories() async {
    _categoryList = List<CategoryTodo>();
    var categories = await _categoryService.readCategories();
    categories.forEach((category) {
      setState(() {
        var categoryModel = CategoryTodo();
        categoryModel.name = category['name'];
        categoryModel.description = category['description'];
        categoryModel.id = category['id'];
        categoryModel.categoryDate = category['categoryDate'];
        _categoryList.add(categoryModel);
      });
    });
  }

  _editCategory(BuildContext context, categoryId) async {
    category = await _categoryService.readCategoryById(categoryId);
    setState(() {
      _editCategoryNameController.text = category[0]['name'] ?? 'No Name';
      _editCategoryDescriptionController.text =
          category[0]['description'] ?? 'No Description';
    });
    _editformDialog(context);
  }

  _showformDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (param) {
          return AlertDialog(
              actions: [
                FlatButton(
                  child: Text("Batal"),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
                FlatButton(
                    child: Text("Simpan"),
                    onPressed: () async {
                      _category.name = _categoryNameController.text;
                      _category.description =
                          _categoryDescriptionController.text;
                      _category.categoryDate = _categoryDateController.text;
                      var result =
                          await _categoryService.saveCategory(_category);
                      print(result);
                      getAllCatagories();
                      Navigator.of(context, rootNavigator: true).pop();
                      // print("category:${_categoryNameController}");
                      // print("category:${_categoryDescriptionController}");
                    })
              ],
              title: Text("formulir kategori"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                        controller: _categoryNameController,
                        decoration: InputDecoration(
                            hintText: "Tulis kategori", labelText: "Kategori")),
                    TextField(
                        maxLines: 5,
                        controller: _categoryDescriptionController,
                        decoration: InputDecoration(
                            hintText: "Deskripsi berisi Motivasi",
                            labelText: "Deskripsi Motivasi")),
                    TextField(
                      showCursor: false,
                      controller: _categoryDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Tanggal dibuat",
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
                  ],
                ),
              ));
        });
  }

  _editformDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
              actions: [
                FlatButton(
                  child: Text("Batal"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                    child: Text("Barui"),
                    onPressed: () async {
                      _category.id = category[0]['id'];
                      _category.name = _editCategoryNameController.text;
                      _category.description =
                          _editCategoryDescriptionController.text;
                      _category.categoryDate = _categoryDateController.text;

                      var result =
                          await _categoryService.updateCategory(_category);
                      if (result > 0) {
                        Navigator.pop(context);
                        getAllCatagories();
                        _showSuccessSnackBar(Text("Diperbaharui"));
                      }
                      // print("category:${_categoryNameController}");
                      // print("category:${_categoryDescriptionController}");
                    })
              ],
              title: Text("edit formulir kategori"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                        controller: _editCategoryNameController,
                        decoration: InputDecoration(
                            hintText: "Tulis Kategori", labelText: "Kategori")),
                    TextField(
                        maxLines: 5,
                        controller: _editCategoryDescriptionController,
                        decoration: InputDecoration(
                            hintText: "Tulis Deskripsi",
                            labelText: "Deskripsi")),
                    TextField(
                      showCursor: false,
                      controller: _categoryDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                          fillColor: mainColor,
                          labelText: "Tanggal dibuat",
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
                  ],
                ),
              ));
        });
  }

  _deleteformDialog(BuildContext context, categoryId) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                child: Text("Batal"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                  child: Text("Hapus"),
                  onPressed: () async {
                    var result =
                        await _categoryService.deleteCategory(categoryId);
                    if (result > 0) {
                      Navigator.pop(context);
                      getAllCatagories();
                      _showSuccessSnackBar(Text("Terhapus"));
                    }
                    // print("category:${_categoryNameController}");
                    // print("category:${_categoryDescriptionController}");
                  })
            ],
            title: Text("Anda yakin akan menghapus ini?"),
          );
        });
  }

  _showSuccessSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    _globalKey.currentState.showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:mainColor,
      key: _globalKey,
      appBar: AppBar(title: Text("Kategori"), backgroundColor: mainColor),
      body: ListView.builder(
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
              child: Card(
                child: ListTile(
                  isThreeLine: true,
                  dense: true,
                  leading: GestureDetector(
                    child: Icon(Icons.edit),
                    onTap: () {
                      _editCategory(context, _categoryList[index].id);
                    },
                  ),
                  title: Text(_categoryList[index].name,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_categoryList[index].description,
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text(_categoryList[index].categoryDate,
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  trailing: GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: () {
                      _deleteformDialog(context, _categoryList[index].id);
                    },
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: mainColor,
            onPressed: () {
              _showformDialog(context);
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 33)
        ],
      ),
    );
  }
}
