import 'package:digital_museum/models/enums.dart';

class Link {
  final int id;
  final String fromExhibitId;
  final String toExhibitId;
  final String reason;
  final Certainty certainty;

  const Link({
    required this.id,
    required this.fromExhibitId,
    required this.toExhibitId,
    required this.reason,
    required this.certainty,
  });
}
