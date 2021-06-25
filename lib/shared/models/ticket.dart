import 'dart:convert';

class Ticket {
  final String? name;
  final String? dueDate;
  final double? money;
  final String? barcode;

  Ticket({
    this.name,
    this.dueDate,
    this.money,
    this.barcode,
  });

  Ticket copyWith({
    String? name,
    String? dueDate,
    double? money,
    String? barcode,
  }) {
    return Ticket(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      money: money ?? this.money,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'money': money,
      'barcode': barcode,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      name: map['name'],
      dueDate: map['dueDate'],
      money: map['money'],
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ticket.fromJson(String source) => Ticket.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ticket(name: $name, dueDate: $dueDate, money: $money, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ticket &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.money == money &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ dueDate.hashCode ^ money.hashCode ^ barcode.hashCode;
  }
}
