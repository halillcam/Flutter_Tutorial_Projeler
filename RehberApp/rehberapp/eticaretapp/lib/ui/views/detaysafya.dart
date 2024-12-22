import 'package:eticaretapp/data/entity/urunler.dart';
import 'package:flutter/material.dart';

class Detaysafya extends StatefulWidget {
  Urunler urun;

  Detaysafya({required this.urun});

  @override
  State<Detaysafya> createState() => _DetaysafyaState();
}

class _DetaysafyaState extends State<Detaysafya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget.urun.ad),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.urun.resim}"),
            Text("${widget.urun.fiyat}",style: const TextStyle(fontSize: 50),)
          ],
        ),

      ),
    );
  }
}