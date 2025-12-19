class VendorOrder {
  final int orderId;
  final String customerName;
  final double amount;
  final String status;
  final DateTime date;

  VendorOrder({
    required this.orderId,
    required this.customerName,
    required this.amount,
    required this.status,
    required this.date,
  });
}
