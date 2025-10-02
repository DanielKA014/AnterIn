import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anterin/models/UserData.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan pesanan baru dengan contoh data
          try {
            Provider.of<UserData>(
              context,
              listen: false,
            ).pesanLayanan("Nebeng Motor", 20000);
          } catch (e) {
            // Tampilkan pesan jika saldo tidak cukup
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(e.toString())));
          }
        },
        tooltip: 'Tambah Pesanan',
        child: Icon(Icons.add),
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
