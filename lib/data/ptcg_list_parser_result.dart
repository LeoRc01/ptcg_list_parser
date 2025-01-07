import 'package:ptcg_list_parser/ptcg_list_parser.dart';

class PTCGListParserResult {
  PTCGListParserResult({required this.cards});

  final List<Card> cards;

  List<Card> get trainers =>
      cards.where((element) => element.cardType == CardType.trainer).toList();

  List<Card> get pokemon =>
      cards.where((element) => element.cardType == CardType.pokemon).toList();

  List<Card> get energies =>
      cards.where((element) => element.cardType == CardType.energy).toList();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PTCGListParserResult &&
          runtimeType == other.runtimeType &&
          cards == other.cards;

  @override
  int get hashCode => cards.hashCode;

  @override
  String toString() {
    return 'PTCGListParserResult{cards: $cards}';
  }
}
