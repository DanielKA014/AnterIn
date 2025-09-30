import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Definisikan kelas Pesanan
class Pesanan {
  final String jenisLayanan;
  final DateTime waktuPesan;
  final int harga;

  Pesanan({
    required this.jenisLayanan,
    required this.waktuPesan,
    required this.harga,
  });
}

class UserData extends ChangeNotifier {
  int saldo = 100000;
  List<Pesanan> riwayatPesanan = [];

  void pesanLayanan(String jenis, int harga) {
    if (saldo >= harga) {
      saldo -= harga;
      riwayatPesanan.insert(
        0,
        Pesanan(jenisLayanan: jenis, waktuPesan: DateTime.now(), harga: harga),
      );
      notifyListeners();
    } else {
      throw Exception("Saldo tidak cukup");
    }
  }
}

class AktivitasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aktivitas")),
      body: Consumer<UserData>(
        builder: (context, userData, child) {
          if (userData.riwayatPesanan.isEmpty) {
            return Center(child: Text("Belum ada aktivitas"));
          }
          return ListView.builder(
            itemCount: userData.riwayatPesanan.length,
            itemBuilder: (context, index) {
              final pesanan = userData.riwayatPesanan[index];
              return ListTile(
                leading: _getIconPesanan(pesanan.jenisLayanan),
                title: Text(pesanan.jenisLayanan),
                subtitle: Text(
                  "Harga: Rp ${pesanan.harga} - ${pesanan.waktuPesan.toLocal()}",
                ),
              );
            },
          );
        },
      ),
    );
  }

  Icon _getIconPesanan(String jenis) {
    switch (jenis) {
      case "Nebeng Mobil":
        return Icon(Icons.directions_car);
      case "Nebeng Motor":
        return Icon(Icons.motorcycle);
      case "Titip antar barang":
        return Icon(Icons.all_inbox);
      default:
        return Icon(Icons.help);
    }
  }
}
