import 'package:filmlerapp/data/entity/filmler.dart';
import 'package:filmlerapp/data/entity/repository/filmlerdao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Filmler>> {
  AnasayfaCubit() : super(<Filmler>[]);
  
  final frepo = FilmlerDaoRepo();
  String _sonAramaKelimesi = '';

  Future<void> FilmleriYukle() async {
    var liste = await frepo.FilmleriYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
  try {
      var liste = await frepo.ara(aramaKelimesi);
      if (!isClosed) {
        emit(liste);
      }
    } catch (e) {
      // Hata durumunda mevcut listeyi koru
      if (!isClosed) {
        emit(state);
      }
    }
  }

}