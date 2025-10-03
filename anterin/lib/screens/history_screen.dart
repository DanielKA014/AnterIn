import 'package:flutter/material.dart';
import '../models/order.dart'; 

class HistoryScreen extends StatefulWidget {
  // Opsional: Constructor untuk pass data dari route
  const HistoryScreen({super.key, this.orders});

  final List<Order>? orders;

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();

    loadOrders();
  }

  Future<void> loadOrders() async {
    setState(() {});
  }

  // Icon berdasarkan jenis order
  IconData getIconForType(String type) {
    switch (type) {
      case 'motor':
        return Icons.two_wheeler;
      case 'mobil':
        return Icons.directions_car;
      case 'delivery':
        return Icons.local_shipping;
      default:
        return Icons.history;
    }
  }

 
  Color getStatusColor(String status) {
    switch (status) {
      case 'completed':
        return Colors.green; // Hijau untuk selesai
      case 'ongoing':
        return Colors.orange; // Oranye untuk sedang berlangsung
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[50], 
      appBar: AppBar(
        title: Text(
          'Riwayat Perjalanan',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFF00C851), 
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF00C851),
                Color(0xFF00A651),
              ], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: orders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 80, color: Color(0xFF00C851)),
                  SizedBox(height: 16),
                  Text(
                    'Belum ada riwayat perjalanan',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Mulai pesan perjalananmu sekarang!',
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  elevation: 4, // Shadow lembut untuk kedalaman
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header: Jenis order dan icon
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xFF00C851).withOpacity(0.1),
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
                                    order.type.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF00C851),
                                    ),
                                  ),
                                  Text(
                                    order.date,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Status
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: getStatusColor(
                                  order.status,
                                ).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: getStatusColor(order.status),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                order.status.toUpperCase(),
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
                        // Detail rute
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
                        // Harga dan tombol detail (opsional)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp ${order.price.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00C851),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Navigasi ke detail order (implementasikan sesuai kebutuhan)
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Detail order ${order.id}'),
                                  ),
                                );
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
