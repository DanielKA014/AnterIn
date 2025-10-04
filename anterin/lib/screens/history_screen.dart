import 'package:flutter/material.dart';
import '../models/order.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late List<Order> orders;

  @override
  void initState() {
    super.initState();
    orders = [
      Order(
        id: '1',
        type: 'motor',
        date: '2025-01-10 10:30',
        status: 'completed',
        pickup: 'Rumah Saya',
        destination: 'Kantor',
        price: 25000.0,
      ),
      // 2. Mobil - Cancelled (merah)
      Order(
        id: '2',
        type: 'mobil',
        date: '2025-09-09 15:45', // Tanggal pemesanan
        status: 'cancelled',
        pickup: 'Mall',
        destination: 'Rumah',
        price: 50000.0,
      ),
      // 3. Pengiriman Barang - Ongoing/On Progress (kuning/oranye)
      Order(
        id: '3',
        type: 'delivery',
        date: '2025-08-09 20:15', // Tanggal pemesanan
        status: 'ongoing',
        pickup: 'Toko Makan',
        destination: 'Alamat Saya',
        price: 15000.0,
      ),
    ];
  }

  IconData getIconForType(String type) {
    switch (type) {
      case 'motor':
        return Icons.two_wheeler; // Icon motor
      case 'mobil':
        return Icons.directions_car; // Icon mobil
      case 'delivery':
        return Icons.local_shipping; // Icon delivery
      default:
        return Icons.history;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'completed':
        return Colors.green; // Hijau untuk selesai
      case 'cancelled':
        return Colors.red; // Merah untuk dibatalkan
      case 'ongoing':
        return Colors.orange; // Kuning/oranye untuk on progress
      default:
        return Colors.grey;
    }
  }

  void _pesanLagi(String type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pesan lagi $type (navigasi ke /ride-$type)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            elevation: 4, // Shadow lembut seperti Gojek
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: Icon, Type, Date, Status Badge
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFF00C851).withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          getIconForType(order.type),
                          color: Color(0xFF00C851),
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.type.toUpperCase(), // e.g., MOTOR
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00C851),
                              ),
                            ),
                            Text(
                              order.date, // Tanggal pemesanan
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Status Badge (mirip Gojek)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: getStatusColor(
                            order.status,
                          ).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: getStatusColor(order.status),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          order.status.toUpperCase(), // e.g., COMPLETED
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: getStatusColor(order.status),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  // Detail Rute (Dari & Ke)
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 8),
                      Expanded(child: Text('Dari: ${order.pickup}')),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 8),
                      Expanded(child: Text('Ke: ${order.destination}')),
                    ],
                  ),
                  SizedBox(height: 12),
                  // Harga & Tombol (Lihat Detail + Pesan Lagi)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Harga
                      Text(
                        'Rp ${order.price.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00C851),
                        ),
                      ),
                      // Tombol Lihat Detail
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Detail order ${order.id}')),
                          );
                          // Ganti dengan navigasi ke detail screen jika ada
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00C851),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Lihat Detail'),
                      ),
                      // Tombol Pesan Lagi (baru, mirip Gojek)
                      OutlinedButton(
                        onPressed: () => _pesanLagi(order.type),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xFF00C851),
                          side: BorderSide(color: Color(0xFF00C851)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Pesan Lagi'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
