part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  final String productId;
  final Function onPressed;
  final String gambar;
  final String judulBuku;
  final String pelajar;
  final String harga;
  final String deprecated;
  ProductCard(
      {this.onPressed,
      this.gambar,
      this.judulBuku,
      this.pelajar,
      this.productId,
      this.harga,
      this.deprecated});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IlmuDetailPage(
                productId: productId,
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        height: 250.0,
        margin: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 24.0,
        ),
        child: Column(
          children: [
            Container(
              height: 158.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  "$gambar",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 102,
                  child: Text(
                    judulBuku,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  pelajar + "  pelajar",
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  deprecated,
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 12.0,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  harga,
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
