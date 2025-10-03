class Order {
  final String id;
  final String type; // e.g., 'motor', 'mobil', 'delivery'
  final String date; // e.g., '2025-10-03 10:30' (String untuk simplicity)
  final String status; // e.g., 'completed', 'ongoing'
  final String pickup;
  final String destination;
  final double price; // Harga sebagai double untuk format Rupiah

  // Constructor wajib (required fields)
  Order({
    required this.id,
    required this.type,
    required this.date,
    required this.status,
    required this.pickup,
    required this.destination,
    required this.price,
  });

  // Optional: Constructor dari JSON (jika data dari API)
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      date: json['date'] ?? '',
      status: json['status'] ?? '',
      pickup: json['pickup'] ?? '',
      destination: json['destination'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
    );
  }

  // Optional: To JSON (untuk simpan ke storage/API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'date': date,
      'status': status,
      'pickup': pickup,
      'destination': destination,
      'price': price,
    };
  }

  // Untuk debugging/print
  @override
  String toString() {
    return 'Order(id: $id, type: $type, date: $date, status: $status, pickup: $pickup, destination: $destination, price: $price)';
  }
}