void main() {
  String nama = "Nur Mahda";
  int jamKerja = 50;
  double upahPerJam = 40000;
  bool statusTetap = true; 

  double gajiKotor = jamKerja * upahPerJam;

  double pajak;
  if (statusTetap) {
    pajak = 0.10 * gajiKotor;
  } else {
    pajak = 0.05 * gajiKotor;
  }

  double gajiBersih = gajiKotor - pajak;
  print("=== Data Gaji Karyawan ===");
  print("Nama Karyawan : $nama");
  print("Gaji Kotor    : Rp ${gajiKotor}");
  print("Pajak         : Rp ${pajak}");
  print("Gaji Bersih   : Rp ${gajiBersih}");
}
