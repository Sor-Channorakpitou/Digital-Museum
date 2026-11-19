import 'package:digital_museum/models/enums.dart';

class Reference {
  final int id;
  final ExhibitType type;
  final String title;
  final String author;
  final int year;
  final String source;

  const Reference({
    required this.id,
    required this.title,
    required this.type,
    required this.author,
    required this.year,
    required this.source,
  });
}
