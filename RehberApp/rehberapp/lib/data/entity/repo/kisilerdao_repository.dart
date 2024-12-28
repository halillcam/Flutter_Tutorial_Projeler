import 'package:rehberapp/data/entity/kisiler.dart';

class KisilerdaoRepository {
  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    print("Kisi kaydet : $kisi_ad, $kisi_tel");
  }

  Future<void> Guncelle(int kisi_id,String kisi_ad, String kisi_tel) async {
    print("guncelle : $kisi_id, $kisi_ad, $kisi_tel");
  }

  Future<List<Kisiler>> KisileriYukle() async {
  var KisilerListesi = <Kisiler>[];
  var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "111111");
  var k2 = Kisiler(kisi_id: 2, kisi_ad: "Halil", kisi_tel: "222222");
  var k3 = Kisiler(kisi_id: 3, kisi_ad: "Duygu", kisi_tel: "333333");
  
  KisilerListesi.add(k1);
  KisilerListesi.add(k2);
  KisilerListesi.add(k3);

  return KisilerListesi;

 }

  Future <List<Kisiler>>ara(String aramaKelimesi) async{
   var KisilerListesi = await KisileriYukle(); // Mevcut kişileri getir
  var sonucListesi = KisilerListesi.where((kisi) {
    return kisi.kisi_ad.toLowerCase().contains(aramaKelimesi.toLowerCase());
  }).toList(); // Arama kelimesine göre filtrele
  return sonucListesi;
  }

  Future <void> Sil(int kisi_id) async {
    print("Sil : $kisi_id");
  }

}