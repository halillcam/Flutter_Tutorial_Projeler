import 'package:filmlerapp/data/entity/filmler.dart';
import 'package:filmlerapp/ui/cubit/anasayfa_cubit.dart';
import 'package:filmlerapp/ui/views/detaysayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  void initState() {
    
    super.initState();
    context.read<AnasayfaCubit>().FilmleriYukle();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filmler"),
      backgroundColor: Colors.black54,
      ),
      body: BlocBuilder<AnasayfaCubit,List<Filmler>>(
        
        builder: (context,filmlerListesi){
          if(filmlerListesi.isNotEmpty){
            
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