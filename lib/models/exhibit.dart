import 'package:digital_museum/models/enums.dart';
import 'package:digital_museum/models/gallery.dart';


class Exhibit {
  final int id;
  final Gallery gallery;
  final String title;
  final ExhibitType type;
  final String summary;
  final String body;
  final String date;
  final bool isApproximate;
  final String image;
  final String imageCredit;
  final String note;
  final List<String> referenceIds;

  const Exhibit({
    required this.id,
    required this.gallery,
    required this.type,
    required this.summary,
    required this.body,
    required this.date,
    required this.image,
    required this.imageCredit,
    required this.referenceIds,
    required this.note,
    required this.title,
    this.isApproximate = true,
  });
}
