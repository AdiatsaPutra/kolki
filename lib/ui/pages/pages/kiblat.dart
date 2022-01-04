part of "pages.dart";

/*part of 'pages.dart';

class MyReward extends StatefulWidget {
  const MyReward({Key key}) : super(key: key);
  @override
  _MyRewardState createState() => _MyRewardState();
}

class _MyRewardState extends State<MyReward> {
  Future _calculateMyCoin(int balance) {
    return _firebaseServices.usersCollection
        .doc(_firebaseServices.getUserId())
        .update({"balance": balance});
  }

  final CollectionReference _tvRef =
      FirebaseFirestore.instance.collection("Tv");
  FirebaseServices _firebaseServices = FirebaseServices();
  int total = 30;
  int balance;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      //pakai blocbuilder karena yg dipilihnya ada di data user
      builder: (_, userState) {
        if (userState is UserLoaded) {
          return Scaffold(
              appBar: AppBar(
                  title: Text(
                      "Tukar koin ${userState.user.balance} baca dengan Hadiah Menakjubkan")),
              body: FutureBuilder<DocumentSnapshot>(
                  future:
                      _tvRef.doc('reward').get(), //minta apapun dalam koleksi
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Container(
                        child: Scaffold(
                          body: Center(
                            child: Text("error${snapshot.error}"),
                          ),
                        ),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> documentData = snapshot.data.data();
                      return Wrap(
                          spacing: 10,
                          runSpacing: 16,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            for (var i = 0;
                                i < documentData["reward"].length;
                                i++)
                              GestureDetector(
                                  onLongPress: () {},
                                  onTap: () {
                                    _calculateMyCoin(balance =
                                        userState.user.balance - total);
                                  },
                                  child: Container(
                                      height: 102,
                                      width: 102,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "${documentData["reward"][i]}"),
                                          ))))
                          ].toList());
                    }
                    return SpinKitFadingCircle(
                      color: accentColor2,
                      size: 50,
                    );
                  }));
        } else {
          return SpinKitFadingCircle(
            color: mainColor,
            size: 50,
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    //getFollowers();
  }
}
//for (var i = 0; i < documentData["link"].length;i++)

// user.balance >= total
//     ? "Checkout Now"
//     : "Top Up My Wallet",
*/
class Keutamaan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
        ),
        Container(
          height: 500,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.teal[100],
          ),
          child: Image.asset(
            'assets/daftar.gif',
            fit: BoxFit.fill,
          ),
        ),
        /*markerRepresent(Colors.red, "Absent"),
            markerRepresent(Colors.green, "Present"),*/
        SizedBox(height: 5),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close_rounded, color: Colors.teal)),
        SizedBox(height: 5),
      ],
    );
  }
}

/*class Kiblat extends StatefulWidget {
  @override
  _KiblatState createState() => _KiblatState();
}

class _KiblatState extends State<Kiblat> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0c7b93),
        primaryColorLight: Color(0xff00a8cc),
        primaryColorDark: Color(0xff27496d),
        accentColor: Color(0xffecce6d),
      ),
      darkTheme: ThemeData.dark().copyWith(accentColor: Color(0xffecce6d)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );

            if (snapshot.data!)
              return QiblahCompass();
            else
              return QiblahMaps();
          },
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widget = (Platform.isAndroid)
        ? CircularProgressIndicator()
        : CupertinoActivityIndicator();
    return Container(
      alignment: Alignment.center,
      child: widget,
    );
  }
}

class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingIndicator();
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();

              case LocationPermission.denied:
                return LocationErrorWidget(
                  error: "Location service permission denied",
                  callback: _checkLocationStatus,
                );
              case LocationPermission.deniedForever:
                return LocationErrorWidget(
                  error: "Location service Denied Forever !",
                  callback: _checkLocationStatus,
                );
              // case GeolocationStatus.unknown:
              //   return LocationErrorWidget(
              //     error: "Unknown Location service error",
              //     callback: _checkLocationStatus,
              //   );
              default:
                return Container();
            }
          } else {
            return LocationErrorWidget(
              error: "Please enable Location service",
              callback: _checkLocationStatus,
            );
          }
        },
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset('assets/compass.svg');
  final _needleSvg = SvgPicture.asset(
    'assets/needle.svg',
    fit: BoxFit.contain,
    height: 300,
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingIndicator();

        final qiblahDirection = snapshot.data!;

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: (qiblahDirection.direction * (pi / 180) * -1),
              child: _compassSvg,
            ),
            Transform.rotate(
              angle: (qiblahDirection.qiblah * (pi / 180) * -1),
              alignment: Alignment.center,
              child: _needleSvg,
            ),
            Positioned(
              bottom: 8,
              child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
            )
          ],
        );
      },
    );
  }
}

class QiblahMaps extends StatefulWidget {
  static final meccaLatLong = const LatLng(21.422487, 39.826206);
  final meccaMarker = Marker(
    markerId: MarkerId("mecca"),
    position: meccaLatLong,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    draggable: false,
  );

  @override
  _QiblahMapsState createState() => _QiblahMapsState();
}

class _QiblahMapsState extends State<QiblahMaps> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng position = LatLng(36.800636, 10.180358);

  Future<Position?>? _future;
  final _positionStream = StreamController<LatLng>.broadcast();


  @override
  void initState() {
    _future = _checkLocationStatus();
    super.initState();
  }

  @override
  void dispose() {
    _positionStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _future,
        builder: (_, AsyncSnapshot<Position?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingIndicator();
          if (snapshot.hasError)
            return LocationErrorWidget(
              error: snapshot.error.toString(),
            );

          if(snapshot.data != null) {
            final loc = LatLng(
                snapshot.data!.latitude, snapshot.data!.longitude);
            position = loc;
          } else
            _positionStream.sink.add(position);

          return StreamBuilder(
            stream: _positionStream.stream,
            builder: (_, AsyncSnapshot<LatLng> snapshot) => GoogleMap(
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              compassEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: position,
                zoom: 11,
              ),
              markers: Set<Marker>.of(
                <Marker>[
                  widget.meccaMarker,
                  Marker(
                    draggable: true,
                    markerId: MarkerId('Marker'),
                    position: position,
                    icon: BitmapDescriptor.defaultMarker,
                    onTap: _updateCamera,
                    onDragEnd: (LatLng value) {
                      position = value;
                      _positionStream.sink.add(value);
                    },
                    zIndex: 5,
                  ),
                ],
              ),
              circles: Set<Circle>.of([
                Circle(
                  circleId: CircleId("Circle"),
                  radius: 10,
                  center: position,
                  fillColor: Theme.of(context).primaryColorLight.withAlpha(100),
                  strokeWidth: 1,
                  strokeColor:
                      Theme.of(context).primaryColorDark.withAlpha(100),
                  zIndex: 3,
                )
              ]),
              polylines: Set<Polyline>.of([
                Polyline(
                  polylineId: PolylineId("Line"),
                  points: [position, QiblahMaps.meccaLatLong],
                  color: Theme.of(context).primaryColor,
                  width: 5,
                  zIndex: 4,
                )
              ]),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          );
        },
      ),
    );
  }

  Future<Position?> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled) {
      return await Geolocator.getCurrentPosition();
    }
    return null;
  }

  void _updateCamera() async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(position, 20));
  }
}

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final box = SizedBox(height: 32);
    final errorColor = Color(0xffb00020);

    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.location_off,
              size: 150,
              color: errorColor,
            ),
            box,
            Text(
              error!,
              style: TextStyle(
                  color: errorColor, fontWeight: FontWeight.bold),
            ),
            box,
            RaisedButton(
              child: Text("Retry"),
              onPressed: () {
                if (callback != null) callback!();
              },
            )
          ],
        ),
      ),
    );
  }
}*/
