import 'dart:math';


class OrderHelper {
  static int generateOrderNumber() {
  final random = Random();
  return 1000 + random.nextInt(9000); // Random number between 1000 and 9999
}
}
