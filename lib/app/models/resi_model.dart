// To parse this JSON data, do
//
//     final resiModel = resiModelFromJson(jsonString);

class ResiModel {
  final String nomorKartu;
  final String gerbangExit;
  final String noResi;
  final String tarif;
  final String golongan;
  final String metoda;
  final String tglTransaksi;

  ResiModel({
    required this.nomorKartu,
    required this.gerbangExit,
    required this.noResi,
    required this.tarif,
    required this.golongan,
    required this.metoda,
    required this.tglTransaksi,
  });
  factory ResiModel.fromJson(Map<String, dynamic> json) {
    return ResiModel(
      nomorKartu: json["nomor_kartu"],
      gerbangExit: json["gerbang_exit"],
      noResi: json["no_resi"],
      tarif: json["tarif"],
      golongan: json["golongan"],
      metoda: json["metoda"],
      tglTransaksi: json["tgl_transaksi"],
    );
  }
}
