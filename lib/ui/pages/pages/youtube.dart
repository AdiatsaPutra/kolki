// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of 'pages.dart';

/*import 'widgets/meta_data_section.dart';
import 'widgets/play_pause_button_bar.dart';
import 'widgets/player_state_section.dart';
import 'widgets/source_input_section.dart';
import 'widgets/volume_slider.dart';*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(YoutubeApp());
}

///
class YoutubeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Player IFrame Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.deepPurpleAccent),
      ),
      debugShowCheckedModeBanner: false,
      home: YoutubeAppDemo(),
    );
  }
}

///
class YoutubeAppDemo extends StatefulWidget {
  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  final double tabBarHeight = 80;
  String videoID = "5qap5aO4i9A";
  List<Map<String, dynamic>> players = [
    {"videoID": "PFO-ZSofj2c", "quality": ThumbnailQuality.max},
    {"videoID": "EgMi4aH4il4", "quality": ThumbnailQuality.max},
    {"videoID": "bhu0x4hoddA", "quality": ThumbnailQuality.max}
  ];
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'tcodrIK2P_I',
      params: const YoutubePlayerParams(
          autoPlay: true,
          playlist: [
            'PFO-ZSofj2c',
            'K18cpp_-gP8',
            '34_PXCzGw1M',
            'iLnmTe5Q2Qw',
            '_WoCV4c6XOE',
            'KmzdUe0RSJo',
            '6jZDSSZZxjQ',
            'p2lYr3vM_1w',
            '7QUtEmBT_-w',
          ],
          startAt: const Duration(minutes: 1, seconds: 36),
          showControls: true,
          showFullscreenButton: true,
          desktopMode: false,
          privacyEnhanced: false,
          showVideoAnnotations: false,
          enableCaption: false,
          enableJavaScript: false,
          strictRelatedVideos: false,
          playsInline: false),
    );
    /* _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Future.delayed(const Duration(seconds: 1), () {
        _controller.play();
      });
      Future.delayed(const Duration(seconds: 5), () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      });
      log('Exited Fullscreen');
    };*/
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KolKi- kitab abijunnasah '),
        ),
        body: SlidingUpPanel(
          isDraggable: true,
          backdropTapClosesPanel: false,
          minHeight: 80,
          maxHeight: MediaQuery.of(context).size.height - tabBarHeight,
          panelBuilder: (scrollController) =>
              buildSlidingPanel(scrollController: scrollController),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (kIsWeb && constraints.maxWidth > 800) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: player),
                    const SizedBox(
                      width: 500,
                      child: SingleChildScrollView(
                        child: Controls(),
                      ),
                    ),
                  ],
                );
              }
              return ListView(
                children: [
                  Stack(
                    children: [
                      SizedBox(height: 10),
                      Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Stack(children: [
                              player,
                              Positioned(
                                  top: 1,
                                  left: 1,
                                  child: Container(
                                    color: Colors.transparent,
                                    height: 60,
                                    width: 250,
                                  )),
                            ]),
                          )),
                    ],
                  ),
                  Container(
                    height: 20,
                    child: Text(
                      "RAGAM MATERI",
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Container(
                    height: 105,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      for (var i in players) ytPlayer(i["videoID"]),
                      Container(child: ytPlayer(videoID)),
                      ytPlayer(videoID),
                      ytPlayer(videoID),
                    ]),
                  ),
                  TextField(),
                  /* RaisedButton(
                      color: Colors.black,
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ()))),*/
                  Container(child: MyNote()),
                  const Controls(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildSlidingPanel({@required ScrollController scrollController}) =>
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: buildTabBar(),
          body: TabBarView(children: [
            MyNote(),
            // UtuhYoutubePlayerDemoApp(),
          ]),
        ),
      );

  Widget buildTabBar() => PreferredSize(
        preferredSize: Size.fromHeight(tabBarHeight),
        child: AppBar(
          toolbarHeight: 22,
          title: buildDragIcon(),
          centerTitle: true,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [Tab(child: Text("belajar")), Tab(child: Text("belanja"))],
          ),
        ),
      );

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void _showDialog(context, videoID) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Container(
          color: Colors.pink,
        );
      },
    );
  }

  Widget ytPlayer(videoID) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _showDialog(
            context,
            videoID,
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (kIsWeb && constraints.maxWidth > 800) {
                      return Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: new Image.network(
                            YoutubePlayerController.getThumbnail(
                                videoId: videoID,
                                // todo: get thumbnail quality from list
                                quality: ThumbnailQuality.max,
                                webp: false),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: new Image.network(
                            YoutubePlayerController.getThumbnail(
                                videoId: videoID,
                                // todo: get thumbnail quality from list
                                quality: ThumbnailQuality.max,
                                webp: false),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            Icon(
              Icons.play_circle_filled,
              color: Colors.white,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDragIcon() => Container(
      width: 40,
      height: 8,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(8)));
}

///
class Controls extends StatelessWidget {
  ///
  const Controls();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Expanded(child: CrudDiary())

          _space,
          // MetaDataSection(),
          /*_space,
          SourceInputSection(),
          _space,
          PlayPauseButtonBar(),
          _space,
          VolumeSlider(),
          _space,
          PlayerStateSection(),*/
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 5);
}
