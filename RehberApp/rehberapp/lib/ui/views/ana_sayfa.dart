import 'package:flutter/material.dart';
import 'package:rehberapp/data/entity/kisiler.dart';
import 'package:rehberapp/ui/views/detay_sayfa.dart';
import 'package:rehberapp/ui/views/kayit_sayfa.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  bool aramaYapiliyormu = false;

  void ara(String aramaKelimesi){
    print("Kisi ara = $aramaKelimesi");
  }

 Future<List<Kisiler>> KisileriYukle() async {
  var KisilerListesi = <Kisiler>[];
  var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "111111");
  var k2 = Kisiler(kisi_id: 2, kisi_ad: "Halil", kisi_tel: "222222");
  var k3 = Kisiler(kisi_id: 3, kisi_ad: "Duygu", kisi_tel: "333333");
  
  KisilerListesi.add(k1);
  KisilerListesi.add(k2);
  KisilerListesi.add(k3);

  return KisilerListesi;

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: aramaYapiliyormu ? 
      TextField(decoration: const InputDecoration(hintText: "Ara"),
      onChanged: (aramaSonucu){
        ara(aramaSonucu);
      },
      
      ) :
      const Text("Kisiler"),
      
      actions: [
        aramaYapiliyormu ? 
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyormu = false;
          });
        }, icon:const Icon(Icons.clear)) : 

        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyormu = true;
          });         
        }, icon: const Icon(Icons.search))

      ],
      ),

      body:FutureBuilder<List<Kisiler>>(future: KisileriYukle(),
       builder: (context,snapshot ){
        if(snapshot.hasData){
          var kisilerListesi = snapshot.data;
          return ListView.builder(
            itemCount: kisilerListesi!.length,
            itemBuilder: (context,indeks){
              var kisi = kisilerListesi[indeks];
              return Card(
                child: Row(
                  children: [
                    SizedBox(height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(kisi.kisi_ad,style: TextStyle(fontSize: 20),),
                            Text(kisi.kisi_tel)
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(onPressed: (){
                      
                    }, icon: const Icon(Icons.clear,color: Colors.black54,))
                  ],
                ),
              );
            },
          );


        }else{
          return const Center(); //Eğer veri yoksa bos bir sayfa goster
        }
       },
       ),
       floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const KayitSayfa()))
        .then((value){
          print("Anasayfaya dönüldü");
        });
      }),
    );
  }
}