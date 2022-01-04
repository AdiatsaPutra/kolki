part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    auth.User firebaseUser = Provider.of<auth.User>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 136,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/kolki_logo.png"))),
              ),
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 16),
                child: Text(
                  "Kolki",
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
              ),
              Text(
                "Ilmu Sebelum Beramal,\nSyukuri dan Jelajahi Kemudahan App",
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                height: 46,
                margin: EdgeInsets.only(top: 70, bottom: 19),
                child: firebaseUser == null
                    ? RaisedButton(
                        child: Text(
                          "Daftar",
                          style: whiteTextFont.copyWith(fontSize: 16),
                        ),
                        color: mainColor,
                        onPressed: () {
                          context
                              .bloc<PageBloc>()
                              .add(GoToRegistrationPage(RegistrationData()));
                        })
                    : Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  firebaseUser == null
                      ? Text(
                          "Sudah Mamiliki Akun? ",
                          style: greyTextFont.copyWith(
                              fontWeight: FontWeight.w400),
                        )
                      : Text(""),
                  GestureDetector(
                    onTap: () {
                      context.bloc<PageBloc>().add(GoToLoginPage());
                    },
                    child: firebaseUser == null
                        ? Text(
                            "Masuk",
                            style: greenTextFont,
                          )
                        : Text(""),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
