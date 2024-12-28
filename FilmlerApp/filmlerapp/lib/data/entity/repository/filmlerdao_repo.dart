import 'package:filmlerapp/data/entity/filmler.dart';

class FilmlerDaoRepo {
  List<Filmler>? _cachedList;

  Future<List<Filmler>> FilmleriYukle() async {
    if (_cachedList != null) return _cachedList!;
    
    var filmlerListesi = <Filmler>[];
    var f1 = Filmler(id: 1, ad: "Django", resim: "django.png");
    var f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar.png");
    var f3 = Filmler(id: 3, ad: "Inception", resim: "inception.png");
    var f4 = Filmler(id: 4, ad: "The Hatefull Eight", resim: "thehatefuleight.png");
    var f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist.png");
    var f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda.png");
    
    filmlerListesi.addAll([f1, f2, f3, f4, f5, f6]);
    
    _cachedList = filmlerListesi;
    return filmlerListesi;
  }

  Future<List<Filmler>> ara(String aramaKelimesi) async {
    var tumFilmler = await FilmleriYukle();
    if (aramaKelimesi.trim().isEmpty) {
      return tumFilmler;
    }
    return tumFilmler.where((film) =>
      film.ad.toLowerCase().contains(aramaKelimesi.toLowerCase())
    ).toList();
  }
}
