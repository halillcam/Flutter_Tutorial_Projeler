import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehberapp/ui/cubit/anasayfa_cubit.dart';
import 'package:rehberapp/ui/cubit/detaysayfa_cubit.dart';
import 'package:rehberapp/ui/cubit/kayitsayfa_cubit.dart';
import 'package:rehberapp/ui/views/ana_sayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> KayitsayfaCubit()),
        BlocProvider(create: (context)=> DetaysayfaCubit()),
        BlocProvider(create: (context)=> AnasayfaCubit()),
      ],
      
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AnaSayfa()
      ),
    );
  }
}

