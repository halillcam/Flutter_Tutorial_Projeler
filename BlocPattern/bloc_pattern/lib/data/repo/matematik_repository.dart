class MatematikRepository {
  int ToplamaYap(String alinanSayi1,String alinanSayi2){
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int toplam = sayi1 + sayi2;
    return toplam;
     

  }

  int CarpmaYap(String alinanSayi1,String alinanSayi2){
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int carpim = sayi1 * sayi2;
    return carpim;
  }
}