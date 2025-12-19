class Order {
  final int orderId;
  final String customerName;
  final String restaurantName;
  final String pickupAddress;
  final String dropAddress;
  final double amount;
  final String status;

  Order({
    required this.orderId,
    required this.customerName,
    required this.restaurantName,
    required this.pickupAddress,
    required this.dropAddress,
    required this.amount,
    required this.status,
  });
}
