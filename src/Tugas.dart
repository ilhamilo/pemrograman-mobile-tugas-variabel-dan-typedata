import 'dart:io';

void main() {

  stdout.write("Masukkan nama karyawan: ");
  String nama = stdin.readLineSync()!;

  stdout.write("Masukkan jumlah jam kerja dalam seminggu: ");
  int jamKerja = int.parse(stdin.readLineSync()!);

  stdout.write("Masukkan upah per jam: ");
  double upahPerJam = double.parse(stdin.readLineSync()!);

  stdout.write("Apakah karyawan tetap? (y/n): ");
  String statusInput = stdin.readLineSync()!.toLowerCase();

  bool statusTetap;

  if (statusInput.isNotEmpty && statusInput[0] == "y") {
    statusTetap = true;
  } else if (statusInput.isNotEmpty && statusInput[0] == "n") {
    statusTetap = false;
  } else {
    print("Input tidak valid, default = kontrak.");
    statusTetap = false;
  }

  Map<String, dynamic> karyawan = {
    "nama": nama,
    "jamKerja": jamKerja,
    "upahPerJam": upahPerJam,
    "statusTetap": statusTetap,
  };

  double gajiKotor = karyawan["jamKerja"] * karyawan["upahPerJam"];

  double pajak;
  if (karyawan["statusTetap"] == true) {
    pajak = gajiKotor * 0.10; 
  } else {
    pajak = gajiKotor * 0.05; 
  }

  double gajiBersih = gajiKotor - pajak;

  karyawan["gajiKotor"] = gajiKotor;
  karyawan["pajak"] = pajak;
  karyawan["gajiBersih"] = gajiBersih;

  print("\n=== Data Gaji Karyawan ===");
  print("Nama Karyawan : ${karyawan["nama"]}");
  print("Status        : ${karyawan["statusTetap"] ? "Tetap" : "Kontrak"}");
  print("Gaji Kotor    : Rp ${karyawan["gajiKotor"].toInt()}");
  print("Pajak         : Rp ${karyawan["pajak"].toInt()}");
  print("Gaji Bersih   : Rp ${karyawan["gajiBersih"].toInt()}");
}
