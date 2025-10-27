abstract class Transportasi {
  String id, nama;       
  double _tarifDasar;    
  int kapasitas;         
  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);
  double get tarifDasar => _tarifDasar; 
  double hitungTarif(int j);             

  void tampilInfo() => print(
      '-- Info Transportasi --\nID : $id\nNama : $nama\nTarif Dasar : $_tarifDasar\nKapasitas : $kapasitas');}

class Taksi extends Transportasi {
  double jarak; 
  Taksi(String id, String n, double t, int k, this.jarak) : super(id, n, t, k);
  double hitungTarif(int j) => tarifDasar * jarak;
  void tampilInfo() {
    super.tampilInfo();
    print('Jarak : $jarak km');
  }
}
class Bus extends Transportasi {
  bool wifi;
  Bus(String id, String n, double t, int k, this.wifi) : super(id, n, t, k);
  double hitungTarif(int j) => (tarifDasar * j) + (wifi ? 5000 : 0);

  void tampilInfo() {
    super.tampilInfo();
    print('Ada Wifi : ${wifi ? "Ya" : "Tidak"}');
  }}

class Pesawat extends Transportasi {
  String kelas;
  Pesawat(String id, String n, double t, int k, this.kelas) : super(id, n, t, k);
  double hitungTarif(int j) => tarifDasar * j * (kelas == "Bisnis" ? 1.5 : 1.1);
  void tampilInfo() {
    super.tampilInfo();
    print('Kelas : $kelas');
  }}

class Pemesanan {
  String id, nama;          
  Transportasi t;           
  int jml;                  
  double total;             
  Pemesanan(this.id, this.nama, this.t, this.jml, this.total);
  void cetakStruk() => print(
      '\n== STRUK PEMESANAN ==\n'
      'ID Pemesanan : $id\n'
      'Nama Pelanggan : $nama\n'
      'Jenis Transportasi : ${t.nama}\n'
      'Jumlah Penumpang : $jml\n'
      'Total Tarif : Rp ${total.toStringAsFixed(2)}\n');
}

Pemesanan pesan(Transportasi t, String n, int j, String id) =>
    Pemesanan(id, n, t, j, t.hitungTarif(j));
void tampil(List<Pemesanan> d) {
  print('\n== RIWAYAT SEMUA PEMESANAN ==');
  for (var p in d) p.cetakStruk();
}

void main() { 
  var t = Taksi("T001", "Taksi BlueBird", 8000, 4, 12.5),
      b = Bus("B001", "Bus TransJakarta", 3000, 40, true),
      p = Pesawat("P001", "Garuda Indonesia", 150000, 150, "Bisnis");
  t.tampilInfo();
  b.tampilInfo();
  p.tampilInfo();
  tampil([
    pesan(t, "Mahda", 1, "PM001"),
    pesan(b, "Johnny", 3, "PM002"),
    pesan(p, "Diva", 2, "PM003")
    ]);
}
