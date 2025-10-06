import 'dart:io';

void main() {
  var makanan = {
    "Ayam Bakar": 25000,
    "Nasi Goreng": 20000,
    "Mie Goreng": 18000,
    "Sate Ayam": 30000,
    "Ikan Bakar": 27000,
    "Bakso": 15000,
    "Soto Ayam": 17000,
    "Nasi Uduk": 16000,
    "Rendang": 35000,
    "Tempe Penyet": 12000
  };

  var minuman = {
    "Es Teh": 5000,
    "Kopi Hitam": 7000,
    "Jus Alpukat": 10000,
    "Es Jeruk": 8000,
    "Air Mineral": 4000,
    "Cappuccino": 12000,
    "Teh Hangat": 5000,
    "Es Coklat": 9000,
    "Susu Jahe": 11000,
    "Lemon Tea": 7000
  };

  bool lanjut = true;

  do {
    int total = 0;
    List<String> pesananMakanan = [];
    List<String> pesananMinuman = [];
    
    bool tambahMakanan = true;
    while (tambahMakanan) {
      print("\n=== MENU MAKANAN ===");
      int i = 1;
      makanan.forEach((key, value) {
        print("$i. $key - Rp$value");
        i++;
      });

      stdout.write("Pilih makanan (1-${makanan.length}): ");
      var pilihM = int.parse(stdin.readLineSync()!);
      if (pilihM >= 1 && pilihM <= makanan.length) {
        var nama = makanan.keys.elementAt(pilihM - 1);
        pesananMakanan.add(nama);
        total += makanan[nama]!;
      } else {
        print("Pilihan tidak ada!");
      }

      stdout.write("Tambah makanan lagi? (y/n): ");
      String? lagi = stdin.readLineSync();
      if (lagi == null || lagi.toLowerCase() != 'y') tambahMakanan = false;
    }

    print("\n=== MENU MINUMAN ===");
    int j = 1;
    while (j <= minuman.length) {
      var nama = minuman.keys.elementAt(j - 1);
      print("$j. $nama - Rp${minuman[nama]}");
      j++;
    }

    bool tambahMinum = true;
    while (tambahMinum) {
      stdout.write("Pilih minuman (1-${minuman.length}): ");
      var pilihD = int.parse(stdin.readLineSync()!);
      if (pilihD >= 1 && pilihD <= minuman.length) {
        var nama = minuman.keys.elementAt(pilihD - 1);
        pesananMinuman.add(nama);
        total += minuman[nama]!;
      } else {
        print("Pilihan tidak ada!");
      }

      stdout.write("Tambah minuman lagi? (y/n): ");
      String? lagi = stdin.readLineSync();
      if (lagi == null || lagi.toLowerCase() != 'y') tambahMinum = false;
    }

    print("\n=== RINGKASAN PESANAN ===");
    print("Makanan: ${pesananMakanan.join(', ')}");
    print("Minuman: ${pesananMinuman.join(', ')}");
    print("Total sebelum diskon: Rp$total");

    if (total > 70000) {
      print("Kamu dapat diskon 10%!");
      total = (total * 0.9).toInt();
    }

    print("Total bayar: Rp$total");

    stdout.write("\nMau pesan lagi? (y/n): ");
    String? jawab = stdin.readLineSync();
    if (jawab == null || jawab.toLowerCase() != 'y') lanjut = false;
  } while (lanjut);

  print("\nTerima kasih sudah pesan di Resto Kami! 🍽️");
}