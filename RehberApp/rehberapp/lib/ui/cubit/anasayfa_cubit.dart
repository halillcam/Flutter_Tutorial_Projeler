import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehberapp/data/entity/kisiler.dart';
import 'package:rehberapp/data/entity/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit <List<Kisiler>> {

  AnasayfaCubit():super(<Kisiler>[]);

  var krepo = KisilerdaoRepository();

  Future<void>kisileriYukle () async {
  var liste = await krepo.KisileriYukle();

  emit(liste);

 }

  Future <void> ara(String aramaKelimesi) async{
    var liste = await krepo.ara(aramaKelimesi);
    emit(liste); 
 
  }

  Future<void> Sil(int kisi_id) async {
    await krepo.Sil(kisi_id);
    await kisileriYukle();
  }
}