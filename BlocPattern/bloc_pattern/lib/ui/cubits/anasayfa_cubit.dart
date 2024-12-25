
import 'package:bloc_pattern/data/repo/matematik_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int>{
  AnasayfaCubit():super(0);

  MatematikRepository m_repo = MatematikRepository();

  void ToplamaYap(String alinanSayi1,String alinanSayi2){
    
    emit(m_repo.ToplamaYap(alinanSayi1,alinanSayi2)); // Tetikleme ve return işlevlerini yapar

  }

  void CarpmaYap(String alinanSayi1,String alinanSayi2){
  emit(m_repo.CarpmaYap(alinanSayi1,alinanSayi2)); // Tetikleme ve return işlevlerini yapar

}
}