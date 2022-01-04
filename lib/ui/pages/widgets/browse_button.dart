part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  BrowseButton(this.genre);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 4),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xFFEEF1F8), borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: SizedBox(
                height: 36,
                child: Image(image: AssetImage(getImageFromGenre(genre)))),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          genre,
          style: blackTextFont.copyWith(fontSize: 13),
        )
      ],
    );
  }

  String getImageFromGenre(String genre) {
    switch (genre) {
      case "Sumatera":
        return "assets/kolki_logo.png";
        break;
      case "Jawa":
        return "assets/kolki_logo.png";
        break;
      case "Kalimantan":
        return "assets/kolki_logo.png";
        break;
      case "Sulawesi":
        return "assets/kolki_logo.png";
        break;
      case "Maluku&Papua":
        return "assets/kolki_logo.png";
        break;
      case "Bali&Nusra":
        return "assets/kolki_logo.png";
        break;
      case "Lapang&Sehat":
        return "assets/kolki_logo.png";
        break;
      case "Iman&Islam":
        return "assets/kolki_logo.png";
        break;
      case "Usia < 10":
        return "assets/kolki_logo.png";
        break;
      case "Usia 11-15":
        return "assets/kolki_logo.png";
        break;
      case "Usia 16-20":
        return "assets/kolki_logo.png";
        break;
      case "Usia > 20":
        return "assets/kolki_logo.png";
        break;
      case "Usia > 30":
        return "assets/kolki_logo.png";
        break;
      case "Usia > 40":
        return "assets/kolki_logo.png";
        break;
      default:
        return "";
    }
  }
}
