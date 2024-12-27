import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehberapp/data/entity/repo/kisilerdao_repository.dart';

class KayitsayfaCubit extends Cubit<void> {
  KayitsayfaCubit():super(0);


var krepo = KisilerdaoRepository();

  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    await kaydet(kisi_ad, kisi_tel);
  }
}