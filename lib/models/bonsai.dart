import 'dart:math';

class Bonsai {
  String name;
  String imagePath;
  String description;
  late int price;
  Bonsai(
      {required this.imagePath,
      required this.name,
      required this.description}) {
    price = Random().nextInt(1000);
  }
}
