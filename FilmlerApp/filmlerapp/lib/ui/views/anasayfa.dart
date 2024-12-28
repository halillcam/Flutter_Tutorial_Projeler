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

  bool aramaYapiliyorMu = false;


  @override
  void initState() {
    
    super.initState();
    context.read<AnasayfaCubit>().FilmleriYukle();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: aramaYapiliyorMu ? TextField(decoration: InputDecoration(hintText: "ara"),
      onChanged: (aramaSonucu){
        context.read<AnasayfaCubit>().ara(aramaSonucu);
      },
     
      ) : const Text("Filmler"),
      actions: [
        aramaYapiliyorMu ? IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = false;
          });
          context.read<AnasayfaCubit>().FilmleriYukle();
        },icon: const Icon(Icons.clear),
        
        ) : 
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = true;
          });
          
        },icon: const Icon(Icons.search),
        )
      ],
      backgroundColor: Colors.red,
      ),
      body: BlocBuilder<AnasayfaCubit,List<Filmler>>(
        
        builder: (context,filmlerListesi){
          if(filmlerListesi.isNotEmpty){
            
            return GridView.builder(
            itemCount: filmlerListesi.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2 / 1.6), 
            itemBuilder: (context,indeks){
              var film = filmlerListesi[indeks];
            
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Detaysayfa(film: film)));
              },
              child: Card(
                
              //color: Colors.black54,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("images/${film.resim}"),
                 
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