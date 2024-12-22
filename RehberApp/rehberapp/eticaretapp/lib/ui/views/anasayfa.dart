import 'package:eticaretapp/data/entity/urunler.dart';
import 'package:eticaretapp/ui/views/detaysafya.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Urunler>> urunleriYukle() async {
    var urunlerListesi = <Urunler>[];
    var u1 = Urunler(id: 1, ad: "Macbook Pro 14", resim: "bilgisayar.png", fiyat: 96000);
    var u2 = Urunler(id: 2, ad: "Rayban Club Master", resim: "gozluk.png", fiyat: 4600);
    var u3 = Urunler(id: 3, ad: "Sony ZX series", resim: "kulaklik.png", fiyat: 40000);
    var u4 = Urunler(id: 4, ad: "Gio armani", resim: "parfum.png", fiyat: 2000);
    var u5 = Urunler(id: 5, ad: "Casio X series", resim: "saat.png", fiyat: 10000);
    var u6 = Urunler(id: 6, ad: "Dyson V8", resim: "supurge.png", fiyat: 12500);
    var u7 = Urunler(id: 7, ad: "Iphone 13", resim: "telefon.png", fiyat: 43250);

    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);
    urunlerListesi.add(u4);
    urunlerListesi.add(u5);
    urunlerListesi.add(u6);
    urunlerListesi.add(u7);

    return urunlerListesi;

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Urunler"),
      ),
      body: FutureBuilder<List<Urunler>>(future: urunleriYukle(),
      builder: (context,snapshot){
        
        if(snapshot.hasData){
          
          var urunlerListesi = snapshot.data;
          return ListView.builder(
            itemCount: urunlerListesi!.length,
            itemBuilder: (context,indeks){
              var urun = urunlerListesi[indeks];

              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Detaysafya(urun: urun)));
                },
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(width: 128, height: 128,
                          child: Image.asset("images/${urun.resim}")),
                      ),
                      Column(
                        children: [
                          Text(urun.ad),
                          const SizedBox(height: 10,),
                          Text("${urun.fiyat} TL",style: TextStyle(fontSize: 20)),
                          const SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                
                          }, child: const Text("Sepete ekle bawemin"))
                
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        else{
          return const Center();
        }

      }), 
    );
  }
}