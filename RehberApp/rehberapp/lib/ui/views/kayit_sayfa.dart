import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehberapp/ui/cubit/kayitsayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayit Sayfasi"),),

      body: Center(
        child: Padding(
         padding: const EdgeInsets.only(left: 50,right: 50),
         child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(controller: tfKisiAdi,decoration: const InputDecoration(hintText: "Kisi ad"),),
            TextField(controller:tfKisiTel,decoration: const InputDecoration(hintText: "Kisi Tel"),),

            ElevatedButton(onPressed: (){
              context.read<KayitsayfaCubit>().kaydet(tfKisiAdi.text,tfKisiTel.text);
            }, child: const Text("Kaydet"))
          ],
         ),
        ),
      ),

     
    );
  }
}