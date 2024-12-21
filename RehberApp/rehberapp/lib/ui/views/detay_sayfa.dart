import 'package:flutter/material.dart';
import 'package:rehberapp/data/entity/kisiler.dart';

class DetaySayfa extends StatefulWidget {

  Kisiler kisi;
  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {

  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  Future<void> Guncelle(int kisi_id,String kisi_ad, String kisi_tel) async {
    print("guncelle : $kisi_id, $kisi_ad, $kisi_tel");
  }
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
              Guncelle(widget.kisi.kisi_id, tfKisiAdi.text, tfKisiTel.text);
            }, child: const Text("Guncelle"))
          ],
         ),
        ),
      ),
    );
  }
}