import 'package:filmlerapp/data/entity/filmler.dart';
import 'package:filmlerapp/ui/detaysayfa.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Filmler>> FilmleriYukle() async{
    var filmlerListesi = <Filmler>[];
    var f1 = Filmler(id: 1, ad: "Django", resim: "django.png", fiyat: 66);
    var f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar.png", fiyat: 150);
    var f3 = Filmler(id: 3, ad: "Inception", resim: "inception.png", fiyat: 31);
    var f4 = Filmler(id: 4, ad: "The Hatefull Eight", resim: "thehatefuleight.png", fiyat: 23);
    var f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist.png", fiyat: 54);
    var f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda.png", fiyat: 78);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);
    return filmlerListesi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filmler"),
      backgroundColor: Colors.black54,
      ),
      body: FutureBuilder<List<Filmler>>(
        future: FilmleriYukle(), 
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmlerListesi = snapshot.data;
            return GridView.builder(
            itemCount: filmlerListesi!.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1 / 1.8), 
            itemBuilder: (context,indeks){
              var film = filmlerListesi[indeks];
            
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Detaysayfa(film: film)));
              },
              child: Card(
                color: Colors.grey,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("images/${film.resim}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${film.fiyat} TL",style: TextStyle(fontSize: 18),),
                        ElevatedButton(onPressed: (){
              
                        }, child: const Text("Sepete ekle"),)
                      ],
                    ),
                  ],
                ),
              ),
            );
            });

            
          }else{  
            return const Center();
          }
        }),
    );
  }
}