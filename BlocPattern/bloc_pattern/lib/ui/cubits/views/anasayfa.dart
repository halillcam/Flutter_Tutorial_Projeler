import 'package:bloc_pattern/ui/cubits/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfSayi1 = TextEditingController();
  var tfSayi2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Pattern")),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AnasayfaCubit,int>(builder: (context,sonuc){ //dinleme
                return Text(sonuc.toString(),style: const TextStyle(fontSize: 35),);
              }),
              
              TextField(controller: tfSayi1,decoration: const InputDecoration(hintText: "Sayi 1"),),
              TextField(controller: tfSayi2,decoration: const InputDecoration(hintText: "Sayi 2"),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                   context.read<AnasayfaCubit>().ToplamaYap(tfSayi1.text, tfSayi2.text);
                  }, child: const Text("Toplama")),
          
                  ElevatedButton(onPressed: (){
                    context.read<AnasayfaCubit>().CarpmaYap(tfSayi1.text, tfSayi2.text);
                      
                  }, child: const Text("Carpma")),

                
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}