import 'package:firebase_core/firebase_core.dart';
import 'package:kolki/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolki/ui/pages/pages/pages.dart';
import 'package:provider/provider.dart';
import 'bloc/blocs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PageBloc()),
            BlocProvider(create: (_) => UserBloc()),
            BlocProvider(create: (_) => ThemeBloc()),
            BlocProvider(create: (_) => PoinBloc()),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (_, themeState) => MaterialApp(
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  home: Wrapper()))),
    );
  }
}

/*import 'package:first/escreen/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        home: LandingPage());
  }
}*/
//import 'package:dcdg/dcdg.dart';
//flutix

/*class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,  
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class MyAppSliver extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SliversExample(),
    );
  }
}*/
//DAENG CERAMAH
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            VideoProvider();
          },
        ) //DEFINISIKAN STATE MANAGEMENT AGAR DAPAT DIGUNAKAN DISEMUA SCREEN / PAGE
      ],
      child: MaterialApp(
        title: 'DaengWeb.id',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home:
            VideoList(), //SCREEN PERTAMA YANG DILOAD KETIKA APLIKASI DIJALANKAN ADALAH LIST VIDEO
        routes: {
          '/detail': (ctx) =>
              VideoDetail() //DEFINISIKAN ROUTING UNTUK MELIHAT DETAIL VIDEO
        },
      ),
    );
  }
}*/

/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ValueNotifier("Some fancy data"),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ChildWidget1(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ValueNotifier<String>>().value = "Some new fancy data";
        },
      ),
    );
  }
}

class ChildWidget1 extends StatelessWidget {
  const ChildWidget1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChildWidget2();
  }
}

class ChildWidget2 extends StatelessWidget {
  const ChildWidget2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChildWidget3();
  }
}

class ChildWidget3 extends StatelessWidget {
  const ChildWidget3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textNotifier = context.watch<ValueNotifier<String>>();
    return Text(_textNotifier.value);
  }
}*/
