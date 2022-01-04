part of 'shared.dart';

const double defaultMargin = 16;

Color mainColor = Color(0xff006A4E); // Color(0xFF503E9D);
Color accentColor1 = Color(0xff3fada8);
Color accentColor2 = Color(0xfffdcf8c6); //Color(0xFFFBD460);
Color accentColor3 = Color(0xFFADADAD);

TextStyle blackTextFont = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.montserrat()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle greenTextFont = GoogleFonts.montserrat()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.montserrat()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle yellowNumberFont =
    GoogleFonts.openSans().copyWith(color: accentColor2);
