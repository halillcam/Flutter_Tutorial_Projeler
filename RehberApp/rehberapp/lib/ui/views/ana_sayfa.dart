import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehberapp/data/entity/kisiler.dart';
import 'package:rehberapp/ui/cubit/anasayfa_cubit.dart';
import 'package:rehberapp/ui/views/detay_sayfa.dart';
import 'package:rehberapp/ui/views/kayit_sayfa.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  bool aramaYapiliyormu = false;



  @override
  void initState() {
    
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: aramaYapiliyormu ? 
      TextField(decoration: const InputDecoration(hintText: "Ara"),
      onChanged: (aramaSonucu){
        context.read<AnasayfaCubit>().ara(aramaSonucu);
      },
      
      ) :
      const Text("Kisiler"),
      
      actions: [
        aramaYapiliyormu ? 
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyormu = false;
          });
          context.read<AnasayfaCubit>().kisileriYukle();  
          
        }, icon:const Icon(Icons.clear)) : 

        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyormu = true;
          });         
        }, icon: const Icon(Icons.search))

      ],
      ),

      body:BlocBuilder<AnasayfaCubit,List<Kisiler>>(
       builder: (context,kisilerListesi ){
        if(kisilerListesi.isNotEmpty){
          return ListView.builder(
            itemCount: kisilerListesi.length,
            itemBuilder: (context,indeks){
              var kisi = kisilerListesi[indeks];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(kisi: kisi)))
                  .then((value){
                    context.read<AnasayfaCubit>().kisileriYukle();  
                  });
                },
                child: Card(
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content:Text("${kisi.kisi_id} Silinsin mi ? "),
                          action: SnackBarAction(label: "Evet", onPressed: (){
                            context.read<AnasayfaCubit>().Sil(kisi.kisi_id);
                          }), 
                          ),
                        );
                      }, icon: const Icon(Icons.delete,color: Colors.red,)), 


                
                    ],
                  ),
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
          context.read<AnasayfaCubit>().kisileriYukle();  
        });
      }),
    );
  }
}