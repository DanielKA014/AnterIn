import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anterin/models/UserData.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Aktivitas")),
      body: userData.riwayatPesanan.isEmpty
          ? Center(child: Text("Belum ada aktivitas"))
          : ListView.builder(
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
