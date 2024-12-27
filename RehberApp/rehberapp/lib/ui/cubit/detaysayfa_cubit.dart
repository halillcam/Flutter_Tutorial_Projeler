import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehberapp/data/entity/repo/kisilerdao_repository.dart';

class DetaysayfaCubit extends Cubit <void> {
  DetaysayfaCubit():super(0);

  var krepo = KisilerdaoRepository();

  Future<void> Guncelle(int kisi_id,String kisi_ad, String kisi_tel) async {
    await krepo.Guncelle(kisi_id, kisi_ad, kisi_tel);
  }
  
}