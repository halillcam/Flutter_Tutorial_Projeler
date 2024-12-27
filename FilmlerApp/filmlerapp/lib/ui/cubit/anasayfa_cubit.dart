import 'package:filmlerapp/data/entity/filmler.dart';
import 'package:filmlerapp/data/entity/repository/filmlerdao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Filmler>> {
  AnasayfaCubit():super(<Filmler>[]);

  var frepo = FilmlerDaoRepo();

  Future<void> FilmleriYukle() async{
  
  var liste = await frepo.FilmleriYukle();
  emit(liste);
  
  }
  

}