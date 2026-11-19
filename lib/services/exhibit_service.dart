import 'package:digital_museum/models/enums.dart';
import 'package:digital_museum/models/exhibit.dart';
import 'package:digital_museum/models/gallery.dart';
import 'package:digital_museum/models/link.dart';

class ExhibitService {
  final List<Exhibit> _exhibits = [];

  List<Exhibit> getExhibits() {
    return _exhibits;
  }

  // Create a new exhibit
  Exhibit createExhibit(Exhibit exhibit) {
    if (_exhibits.any((e) => e.id == exhibit.id)) {
      throw ArgumentError('Exhibit with id ${exhibit.id} already exists');
    }

    _exhibits.add(exhibit);
    return exhibit;
  }

  // Get all exhibits by gallery
  List<Exhibit> getExhibitsByGallery(Gallery gallery) {
    return _exhibits.where((e) => e.gallery.id == gallery.id).toList();
  }

  // Relevant exhibit linking
  Link linkExhibits({
    required String from,
    required String to,
    required String reason,
    required Certainty certainty,
  }) {
    // Validate that both source and target exhibits exist.
    final fromExists = _exhibits.any((e) => e.id.toString() == from);
    final toExists = _exhibits.any((e) => e.id.toString() == to);
    if (!fromExists || !toExists) {
      throw ArgumentError('Both from and to exhibits must exist');
    }
    return Link(
      id: _exhibits.length + 1,
      fromExhibitId: from,
      toExhibitId: to,
      reason: reason,
      certainty: certainty,
    );
  }
}
