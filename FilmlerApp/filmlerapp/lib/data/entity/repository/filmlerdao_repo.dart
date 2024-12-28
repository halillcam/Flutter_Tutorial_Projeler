import 'package:filmlerapp/data/entity/filmler.dart';

class FilmlerDaoRepo {
   Future<List<Filmler>> FilmleriYukle() async{
    var filmlerListesi = <Filmler>[];
    var f1 = Filmler(id: 1, ad: "Django", resim: "django.png");
    var f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar.png");
    var f3 = Filmler(id: 3, ad: "Inception", resim: "inception.png");
    var f4 = Filmler(id: 4, ad: "The Hatefull Eight", resim: "thehatefuleight.png");
    var f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist.png");
    var f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda.png");
    
    filmlerListesi.addAll([f1,f2,f3,f4,f5,f6]);
  
    return filmlerListesi;
  }

 Future<List<Filmler>> ara(String aramaKelimesi) async {
  var tumFilmler = await FilmleriYukle(); // Tüm filmleri yükle
  var filtreliFilmler = tumFilmler.where((film) {
    return film.ad.toLowerCase().contains(aramaKelimesi.toLowerCase()); // Film adıyla arama yap
  }).toList();

  return filtreliFilmler; // Filtrelenmiş listeyi döndür
}

  
}