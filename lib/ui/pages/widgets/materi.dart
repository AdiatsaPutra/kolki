part of 'widgets.dart';

class Materi extends StatefulWidget {
  final List promateri;
  final Function(String) onSelected;

  const Materi({Key key, this.promateri, this.onSelected}) : super(key: key);
  @override
  _MateriState createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < widget.promateri.length; i++)
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.onSelected(
                    "${widget.promateri[i]}",
                  );
                  setState(() {
                    _selected = i;
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    width: 175,
                    decoration: BoxDecoration(
                        color: _selected == i ? accentColor1 : accentColor3,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "${widget.promateri[i]}",
                      textAlign: TextAlign.center,
                    )),
              ),
              SizedBox(width: defaultMargin),
            ],
          ),
      ],
    );
  }
}
