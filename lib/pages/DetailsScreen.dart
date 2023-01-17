import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final heroTag;
  final Wpoknom;
  final Wpoktipo;
  final Wpoknum;
  final WpokImg;
  final WpokAltura;
  final WpokPeso;
  const DetailsScreen(
      {super.key,
      this.heroTag,
      this.Wpoknom,
      this.Wpoktipo,
      this.Wpoknum,
      this.WpokImg,
      this.WpokAltura,
      this.WpokPeso});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.Wpoktipo == "Grass"
          ? Colors.greenAccent
          : widget.Wpoktipo == "Fire"
              ? Colors.redAccent
              : widget.Wpoktipo == "Water"
                  ? Colors.blueAccent
                  : widget.Wpoktipo == "Bug"
                      ? Colors.orangeAccent
                      : widget.Wpoktipo == "Poison"
                          ? Colors.purpleAccent
                          : widget.Wpoktipo == "Electric"
                              ? Colors.cyanAccent
                              : widget.Wpoktipo == "Ground"
                                  ? Colors.brown
                                  : widget.Wpoktipo == "Fighting"
                                      ? Colors.lightGreen
                                      : widget.Wpoktipo == "Psychic"
                                          ? Colors.pinkAccent
                                          : widget.Wpoktipo == "Dragon"
                                              ? Colors.blueGrey
                                              : widget.Wpoktipo == "Rock"
                                                  ? Colors.grey
                                                  : widget.Wpoktipo == "Ice"
                                                      ? Colors.lightBlue
                                                      : widget.Wpoktipo ==
                                                              "Ghost"
                                                          ? Colors.amberAccent
                                                          : Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _FlechaAtras(),
          _NombreNumeroPokemon(),
          _TipoPokemon(),
          _PokeballFondo(),
          Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text(
                                "Altura: ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                              child: Text(
                                widget.WpokAltura.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text(
                                "Peso: ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                              child: Text(
                                widget.WpokPeso.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              top: (height * 0.2),
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                  imageUrl: widget.WpokImg,
                  height: 220,
                  width: 220,
                  fit: BoxFit.cover,
                ),
              )),
        ],
      ),
    );
  }

  Widget _FlechaAtras() {
    return Positioned(
        top: 35,
        left: 5,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget _NombreNumeroPokemon() {
    return Positioned(
        top: 80,
        left: 20,
        right: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.Wpoknom.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "#" + widget.Wpoknum.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ));
  }

  Widget _TipoPokemon() {
    return Positioned(
        top: 130,
        left: 25,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.Wpoktipo.toString(),
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ));
  }

  Widget _PokeballFondo() {
    var height = MediaQuery.of(context).size.height;
    return Positioned(
        top: height * 0.18,
        right: -30,
        child: Image.asset(
          'images/pokeball.png',
          height: 200,
          fit: BoxFit.fitHeight,
        ));
  }

  /*Widget _ImagenPokemon(Widget heroTag) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Positioned(
        top: (height * 0.2),
        child: Hero(
          tag: heroTag,
          child: CachedNetworkImage(
            imageUrl: 'http://www.serebii.net/pokemongo/pokemon/001.png',
            height: 220,
            width: 220,
            fit: BoxFit.cover,
          ),
        ));
  }*/
}
