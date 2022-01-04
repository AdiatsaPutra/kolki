//import 'package:first/shared/shared.dart';
part of 'widgets.dart';

class JadwalSholat extends StatefulWidget {
  @override
  _JadwalSholatState createState() => _JadwalSholatState();
}

class _JadwalSholatState extends State<JadwalSholat> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position userLocation;
  Placemark userAddress;

  FirebaseServices _firebaseServices = FirebaseServices();
  double lat_value = -6.200000; //-3.0149806;
  double long_value = 106.816666; //120.1649646;
  String address = "Kota Jakarta"; //"Kota Palopo";
  Future _addMyLocation() {
    return _firebaseServices.usersCollection
        .doc(_firebaseServices.getUserId())
        .update({"alamat": address});
  }

  List<String> _prayerTimes = [];
  List<String> _prayerNames = [];
  List initData = [];

  @override
  void initState() {
    super.initState();

    getSP().then((value) {
      initData = value;
      getPrayerTimes(lat_value, long_value);
      getAddress(lat_value, long_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _addMyLocation();
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                      getPrayerTimes(
                          userLocation.latitude, userLocation.longitude);
                      getAddress(userLocation.latitude, userLocation.longitude);
                      address = " ${userAddress.subAdministrativeArea}, "
                          " ${userAddress.country} ";
                      print(" ${userAddress.subAdministrativeArea}, "
                          " ${userAddress.country} ");
                    });

                    setSP();
                  });
                },
                icon: Icon(
                  Icons.location_on,
                  color: Colors.teal,
                ),
                label: Text(
                  address ?? "Mencari lokasi anda ...",
                  style: TextStyle(
                      color: Colors.teal,
                      //  fontFamily: 'Montserrat',
                      fontSize: 14),
                )),
            SizedBox(height: 0),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _prayerNames.length,
                  itemBuilder: (context, position) {
                    return Container(
                      padding: EdgeInsets.all(2),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.teal[50],
                          ),
                          width: 50,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(_prayerNames[position],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.teal,
                                    // fontFamily: 'Montserrat',
                                  )),
                              Text(_prayerTimes[position],
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 15,
                                      //fontFamily: 'Monserrat',
                                      fontWeight: FontWeight.bold
                                      // fontFamily: 'Montserrat',
                                      ))
                            ],
                          )),
                      // SizedBox(width: 10),
                    );
                  }),
            ),

            //SizedBox(height: 10),
          ]),
    );
  }

  Future<Position> _getLocation() async {
    var currentLocation;

    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  getAddress(double lat, double long) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(lat, long);
      Placemark place = p[0];
      userAddress = place;
      print("future :" + place.subAdministrativeArea);
    } catch (e) {
      userAddress = null;
    }
  }

  getPrayerTimes(double lat, double long) {
    PrayerTime prayers = new PrayerTime();

    prayers.setTimeFormat(prayers.getTime24());
    prayers.setCalcMethod(prayers.getMWL());
    prayers.setAsrJuristic(prayers.getShafii());
    prayers.setAdjustHighLats(prayers.getAdjustHighLats());

    List<int> offsets = [-6, 0, 3, 2, 0, 3, 6];

    String tmx = "${DateTime.now().timeZoneOffset}";

    var currentTime = DateTime.now();
    var timeZone = double.parse(tmx[0]);

    prayers.tune(offsets);

    setState(() {
      _prayerTimes = prayers.getPrayerTimes(currentTime, lat, long, timeZone);
      _prayerNames = prayers.getTimeNames();
    });
  }

  void setSP() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setDouble('key_lat', userLocation.latitude);
    pref.setDouble('key_long', userLocation.longitude);
    pref.setString('key_address',
        " ${userAddress.subAdministrativeArea}" "${userAddress.country} ");
  }

  Future<dynamic> getSP() async {
    List dataPref = [];
    SharedPreferences pref = await SharedPreferences.getInstance();

    lat_value = pref.getDouble('key_lat');
    long_value = pref.getDouble('key_long');
    address = pref.getString('key_address');

    dataPref.add(lat_value);
    dataPref.add(long_value);
    dataPref.add(address);

    return dataPref;
  }
}

// "Lokasi: lat : ${userLocation.latitude.toString()} , long: ${userLocation.longitude.toString()}"
