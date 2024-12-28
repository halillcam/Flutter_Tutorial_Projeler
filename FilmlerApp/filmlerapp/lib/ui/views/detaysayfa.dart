import 'package:filmlerapp/data/entity/filmler.dart';
import 'package:flutter/material.dart';

class Detaysayfa extends StatefulWidget {

  Filmler film;
  Detaysayfa({required this.film});

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget.film.ad),
      ),
      body:  Center(
        child: Column(
          children: [
            Image.asset("images/${widget.film.resim}"),
          
          ],
        ),
      ),
    );
  }
}