class Tickets {
  final String? id;
  final String? from;
  final String? to;
  final String ?departDate;
  final String? returnDate;
  final String? trainClass;
  final int? adultNum;
  final int? childNum;
  final double? price;
  // final String returnDate;
  // final String trainClass;
  // final String price;

  Tickets(
      {required this.id,
      required this.from,
      required this.to,
      required this.departDate,
      this.returnDate,
      this.trainClass,
      this.adultNum,
      this.childNum,
      this.price
      // required this.returnDate,
      // required this.trainClass,
      // required this.price,
      });
  Tickets.withoutId(
      {required this.from,
      required this.to,
      required this.departDate,
      this.returnDate,
      this.trainClass,
      this.adultNum,
      this.childNum,
      this.price
      // required this.returnDate,
      // required this.trainClass,
      // required this.price,
      })
      : id = (_idCounter++).toString();

  static int _idCounter = 0;
  List<Tickets> tickets = [];
}
