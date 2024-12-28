import 'dart:async';

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
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().FilmleriYukle();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _handleSearch(String aramaSonucu) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      if (aramaSonucu.isEmpty) {
        context.read<AnasayfaCubit>().FilmleriYukle();
      } else {
        context.read<AnasayfaCubit>().ara(aramaSonucu);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu 
          ? TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Search the Movie",
                hintStyle: TextStyle(color: Colors.white)
              ),
              onChanged: _handleSearch,
            )
          : const Text("Welcome to the Filmexplore"),
        actions: [
          aramaYapiliyorMu 
            ? IconButton(
                onPressed: () {
                  setState(() {
                    aramaYapiliyorMu = false;
                    _searchController.clear();
                  });
                  context.read<AnasayfaCubit>().FilmleriYukle();
                },
                icon: const Icon(Icons.clear),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    aramaYapiliyorMu = true;
                  });
                },
                icon: const Icon(Icons.search),
              )
        ],
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<AnasayfaCubit, List<Filmler>>(
        builder: (context, filmlerListesi) {
          if (filmlerListesi.isNotEmpty) {
            return GridView.builder(
              itemCount: filmlerListesi.length,
              cacheExtent: 500,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 1.6
              ),
              itemBuilder: (context, indeks) {
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detaysayfa(film: film)
                      )
                    );
                  },
                  child: Card(
                    key: ValueKey(film.id),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("images/${film.resim}"),
                      ],
                    ),
                  ),
                );
              }
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
}