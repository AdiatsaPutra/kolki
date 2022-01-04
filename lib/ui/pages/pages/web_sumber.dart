part of 'pages.dart';

class CalendarPage2 extends StatefulWidget {
  final String category;

  const CalendarPage2({Key key, this.category}) : super(key: key);
  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
}

//intl.DateFormat format-intl.DateFormat("yyyy/MM/dd");
//for(var string in stringList){stringDate.add(format.parse(string));};
//var stringDate=stringList.todoDate.map((string)=> DateFormat.parse(string)).toList();

List<DateTime> presentDates = [
  DateTime(2021, 5, 1),
  DateTime(2021, 5, 3),
  DateTime(2021, 5, 4),
  DateTime(2021, 5, 5),
  DateTime(2021, 5, 6),
  DateTime(2021, 5, 9),
  DateTime(2021, 5, 10),
  DateTime(2021, 5, 11),
  DateTime(2021, 5, 15),
  DateTime(2021, 5, 22),
  DateTime(2021, 5, 23),
];
List<Todo> _todoList = List<Todo>();
//List<String>_todoList=new List<String>(){'yyyy-MM-dd'};
//List<DateTime> absentDates=_todoList.Select(date=>DateTime.parse(absentDates)).toList();
//foreach(string s in stringList)dateTimeList.Add(Convert.ToDateTime(s));
List<DateTime> absentDates = [
  DateTime(2021, 5, 2),
  DateTime(2021, 5, 7),
  DateTime(2021, 5, 8),
  DateTime(2021, 5, 12),
  DateTime(2021, 5, 13),
  DateTime(2021, 5, 14),
  DateTime(2021, 5, 16),
  DateTime(2021, 5, 17),
  DateTime(2021, 5, 18),
  DateTime(2021, 5, 19),
  DateTime(2021, 5, 20),
];

class _CalendarPage2State extends State<CalendarPage2> {
  List<Todo> _todoList = List<Todo>();
  TodoService _todoService = TodoService();
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

  DateTime _currentDate2 = DateTime.now();
  static Widget _presentIcon(String day) => CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(
          day,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
  static Widget _absentIcon(String day) => CircleAvatar(
        backgroundColor: Colors.red,
        child: Text(
          day,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  CalendarCarousel _calendarCarouselNoHeader;

  var len = math.min(absentDates?.length, presentDates.length);
  //var len = min(absentDates?.length, _todoList.length);
  double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    /* for (int i = 0; i < 0; i++) {
      _markedDateMap.add(
        DateTime.parse(_todoList[i].todoDate), // presentDates[i],
        new Event(
          date: DateTime.parse(_todoList[i].todoDate),
          title: 'Event 5',
          icon: _presentIcon(_todoList[i].todoDate),
        ),
      );
    }*/

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        absentDates[i],
        new Event(
          date: absentDates[i],
          title: 'Event 5',
          icon: _absentIcon(
            absentDates[i].day.toString(),
          ),
        ),
      );
    }

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      todayButtonColor: Colors.blue[200],
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      scrollDirection: Axis.vertical,
      markedDateMoreShowTotal:
          null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.teal[100],
              ),
              child: _calendarCarouselNoHeader),
          /*markerRepresent(Colors.red, "Absent"),
              markerRepresent(Colors.green, "Present"),*/
          SizedBox(height: 5),
          IconButton(
              color: Colors.teal[100],
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close_rounded, color: Colors.teal)),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
        /*  leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title: new Text(
        data,
      ),*/
        );
  }
}
