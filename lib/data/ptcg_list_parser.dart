import 'package:ptcg_list_parser/ptcg_list_parser.dart';

class PTCGListParser {
  const PTCGListParser({
    required String list,
  }) : _list = list;

  /// The list in a text format
  final String _list;

  PTCGListParserResult parse() {
    final lines = _list.split('\n');
    final categorizedLines = <int, List<String>>{
      0: [], // Pokémon
      1: [], // Trainer
      2: [] // Energies
    };

    int blankLinesCount = 0;

    for (final line in lines) {
      final trimmedLine = line.trim();

      if (trimmedLine.isEmpty) {
        blankLinesCount++;
      } else {
        categorizedLines[blankLinesCount]?.add(trimmedLine);
      }
    }

    for (final category in categorizedLines.values) {
      if (category.isNotEmpty) {
        category.removeAt(0);
      }
    }

    final pokemon = categorizedLines[0]!
        .map((e) => Card.fromString(string: e, cardType: CardType.pokemon))
        .toList();

    final trainers = categorizedLines[1]!
        .map((e) => Card.fromString(string: e, cardType: CardType.trainer))
        .toList();

    final energies = categorizedLines[2]!
        .map((e) => Card.fromString(string: e, cardType: CardType.energy))
        .toList();

    return PTCGListParserResult(cards: [...pokemon, ...trainers, ...energies]);
  }
}
