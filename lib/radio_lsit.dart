import 'package:kolki/radio_model.dart';

class Channel {
  String url;
  String title;
  String gerne;
  int rank;
  String imgurl;
  Channel({this.title, this.url, this.gerne, this.imgurl});

  factory Channel.fromJson(Map<String, dynamic> parsedJson) {
    return Channel(
        title: parsedJson['title'].toString(),
        url: parsedJson['url'],
        gerne: parsedJson['type'].toString(),
        imgurl: parsedJson['imgurl'].toString());
  }
  static getCategories(List<Channel> list) {
    return Set.from(list.map((ch) => ch.gerne)).toList();
  }
}

List getChannels() {
  return [
    Channel(
        title: "Radio Rodja 756AM Bogor\nmenebar cahaya sunnah",
        url: "https://radioislamindonesia.com:7000/;stream.mp3?_=1",
        gerne: "",
        imgurl:
            "https://upload.wikimedia.org/wikipedia/id/e/ec/Rodja756am.png"),
    Channel(
        url:
            "https://radioislamindonesia.com:7002/;stream/1", //"http://5.196.56.208:8308/stream",
        title: "Radio Tarbiyah Sunnah 1476AM \nLillah, Nyunnah, Merenah",
        imgurl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR1LgBKk-alZb6yjmuRbdn8iWmH8-RBAvqZb6qo_OV47wShCLfeyHXLzxaoXdoAbA9D1w&usqp=CAU"), //   "https://images-na.ssl-images-amazon.com/images/I/51WSc%2BN-5CL._SY355_.png"),
    Channel(
        title: "Radio Muslim 1467AM Jogja\nMemurnikan Aqidah Menebarkan Sunnah",
        url: "https://cp.phpmystream.com/radioSSLnew/s/75",
        imgurl: "http://live.artvisi.or.id/logo/bannerradiomuslim.png"),
    Channel(
        url: "http://live.radiosunnah.net/;stream.nsv",
        title: "Radio Kita 93,4 FM Cirebon\nMeniti Ilmu Menata Hati",
        imgurl:
            "https://cdn.webrad.io/images/logos/radioonline-co-id/kita-cirebon.png"),
    Channel(
        url: "http://streaming.an-nashihah.com:9988/;stream.nsv",
        title: "Radio an Nashihah 88,2 FM Takalar\nSakinah dengan Sunnah",
        imgurl:
            "https://radio.an-nashihah.com/wp-content/uploads/2017/04/logo-radio-an-nashihah.jpg"),
  ];
}

Channel currentCh = getChannels()[0];
PlayerModel playerModel = PlayerModel();
