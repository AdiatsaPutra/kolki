part of 'pages.dart';

class WebViewExample extends StatefulWidget {
  const WebViewExample({Key key}) : super(key: key);

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    this._controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = 'www.google.com';
    return 
        ButtonBar(
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.open_in_new),
              label: Text('Membaca Quran'),
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                this._openInWebview('https://www.notequran.com');
              },
            ),
          ],
        
    );
  }

  Future<Null> _openInWebview(String url) async {
    if (await url_launcher.canLaunch(url)) {
      Navigator.of(this.context).push(
        MaterialPageRoute(
          builder: (ctx) => WebviewScaffold(
            initialChild: Center(child: CircularProgressIndicator()),
            url: url,
            appBar: AppBar(title: Text(url)),
          ),
        ),
      );
    } else {
      Scaffold.of(this.context).showSnackBar(
        SnackBar(
          content: Text('URL $url can not be launched.'),
        ),
      );
    }
  }
}
