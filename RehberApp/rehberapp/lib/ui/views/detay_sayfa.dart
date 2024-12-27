import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehberapp/data/entity/kisiler.dart';
import 'package:rehberapp/ui/cubit/detaysayfa_cubit.dart';

class DetaySayfa extends StatefulWidget {

  Kisiler kisi;
  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {

  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var kisi = widget.kisi;
    tfKisiAdi.text = kisi.kisi_ad;
    tfKisiTel.text = kisi.kisi_tel;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detay Sayfasi"),),

      body: Center(
        child: Padding(
         padding: const EdgeInsets.only(left: 50,right: 50),
         child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(controller: tfKisiAdi,decoration: const InputDecoration(hintText: "Kisi ad"),),
            TextField(controller:tfKisiTel,decoration: const InputDecoration(hintText: "Kisi Tel"),),

            ElevatedButton(onPressed: (){
             context.read<DetaysayfaCubit>().Guncelle(widget.kisi.kisi_id,tfKisiAdi.text,tfKisiTel.text);
            }, child: const Text("Guncelle"))
          ],
         ),
        ),
      ),
    );
  }
}