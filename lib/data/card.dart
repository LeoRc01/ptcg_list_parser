import 'package:ptcg_list_parser/data/card_type.dart';

class Card {
  const Card({
    required this.quantity,
    required this.name,
    required this.set,
    required this.code,
    required this.cardType,
  });

  factory Card.fromString({
    required String string,
    required CardType cardType,
  }) {
    final regExp = RegExp(r'(\d+)\s+(.+?)\s+([A-Z]+)\s+(\d+)');

    final match = regExp.firstMatch(string);

    if (match != null) {
      final quantity = int.parse(match.group(1)!);
      final name = match.group(2)!.trim();
      final set = match.group(3)!;
      final code = match.group(4)!;

      return Card(
        quantity: quantity,
        name: name,
        set: set,
        code: code,
        cardType: cardType,
      );
    } else {
      throw Exception('Could not parse card.');
    }
  }

  final int quantity;
  final String name;
  final String set;
  final String code;
  final CardType cardType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Card &&
          runtimeType == other.runtimeType &&
          quantity == other.quantity &&
          name == other.name &&
          set == other.set &&
          code == other.code &&
          cardType == other.cardType;

  @override
  int get hashCode =>
      quantity.hashCode ^
      name.hashCode ^
      set.hashCode ^
      code.hashCode ^
      cardType.hashCode;

  @override
  String toString() {
    return 'Card{quantity: $quantity, name: $name, set: $set, code: $code, cardType: $cardType}';
  }
}
