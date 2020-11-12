//---- Packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linger/src/pages/home/functions/calc_frete.dart';

class Product extends StatefulWidget {
  Product({Key key, this.dataProduct}) : super(key: key);
  final QueryDocumentSnapshot dataProduct;
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  PageController _pageController = PageController();
  int _image = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.04,
              left: size.width * 0.01,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                    size: 38,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Positioned(
              top: size.height * 0.04,
              left: size.width * 0.4,
              child: IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.blue,
                    size: 38,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Positioned(
              top: size.height * 0.04,
              left: size.width * 0.8,
              child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.blue,
                    size: 38,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Container(
              padding: EdgeInsets.all(0),
              width: size.width,
              height: size.height * 0.5,
              child: CarouselSlider.builder(
                  itemCount: widget.dataProduct["image"].length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.dataProduct["image"][index],
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          _image = reason.index;
                        });
                      },
                      enableInfiniteScroll: false,
                      initialPage: 0)),
            ),
            Positioned(
                top: size.height * 0.09,
                left: size.width * 0.15,
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("$_image/${widget.dataProduct["image"].length}"),
                )),
            Positioned(
                top: size.height * 0.4,
                left: size.width * 0.15,
                child: Icon(Icons.star, color: Colors.blue)),
            Positioned(
                top: size.height * 0.4,
                left: size.width * 0.1,
                child: Icon(Icons.star, color: Colors.blue)),
            Positioned(
                top: size.height * 0.4,
                left: size.width * 0.20,
                child: Icon(Icons.star, color: Colors.blue)),
            Positioned(
                top: size.height * 0.4,
                left: size.width * 0.25,
                child: Icon(Icons.star, color: Colors.blue)),
            Positioned(
                top: size.height * 0.4,
                left: size.width * 0.3,
                child: Icon(Icons.star, color: Colors.black12)),
            Positioned(
                top: size.height * 0.36,
                left: size.width * 0.68,
                child: Container(
                  width: size.width * 0.13,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                      icon: Icon(Icons.share, color: Colors.white, size: 24),
                      onPressed: () {}),
                )),
            Positioned(
              top: size.height * 0.44,
              left: size.width * 0.0,
              right: size.width * 0.0,
              child: Container(
                width: size.width,
                child: ListTile(
                  title: Text(
                    "${widget.dataProduct["title"]}",
                    style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                  ),
                  subtitle: Text(
                    "${widget.dataProduct["subtitle"]}",
                    style: TextStyle(fontSize: 16, color: Colors.blue[300]),
                  ),
                  trailing: Text(
                      "R\S${widget.dataProduct["price"].toString().replaceAll(".", ",")} por Hora",
                      style: TextStyle(fontSize: 14, color: Colors.blue[200])),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.56,
              child: Container(
                  width: size.width * 0.25,
                  height: size.height * 0.05,
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "CEP",
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10))))),
            ),
            //Divider(height: size.height * 0.05, color: Colors.white),
            Positioned(
              top: size.height * 0.6,
              child:
                  TextButton(onPressed: () {}, child: Text("Calcular frete")),
            ),
            Positioned(
                top: size.height * 0.67,
                child: Container(
                    width: size.width * 0.9,
                    child: Text(
                      "Descrição do produto gkaskgksdkhgksdkhykerkgktoemgsdokkohgko" +
                          "ksmdokmfdgokmokmsdkmgkmsdkmkksklhgklkmlsdklmgkmmskmmvmsommdfkgkdkmskmfksdkgsddmgçdmçgdfç",
                      style: TextStyle(fontSize: 15, color: Colors.blue[700]),
                    ))),
            Positioned(
                top: size.height * 0.9,
                left: size.width * 0.02,
                right: size.width * 0.02,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        width: size.width * 1,
                        height: size.height * 0.06,
                        child: RaisedButton(
                          child: Text(
                            "Alugue agora",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: Colors.blue,
                          onPressed: () async {
                            await CalcularFrete().calcFrete();
                          },
                        ))))
          ],
        ),
      ),
    ));
  }
}
