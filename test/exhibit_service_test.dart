import 'package:digital_museum/models/enums.dart';
import 'package:digital_museum/models/exhibit.dart';
import 'package:digital_museum/models/gallery.dart';
import 'package:digital_museum/services/exhibit_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExhibitService', () {
    final service = ExhibitService();

    final gallery = Gallery(
      id: 1,
      name: 'Angkor',
      period: '12th-13th',
      order: 1,
    );

    final exhibitA = Exhibit(
      id: 1,
      gallery: gallery,
      type: ExhibitType.site,
      summary: '',
      body: '',
      date: '1122',
      image: '',
      imageCredit: '',
      referenceIds: [],
      note: '',
      title: 'Angkor Wat',
    );

    final exhibitB = Exhibit(
      id: 2,
      gallery: gallery,
      type: ExhibitType.artifact,
      summary: '',
      body: '',
      date: '1150',
      image: '',
      imageCredit: '',
      referenceIds: [],
      note: '',
      title: 'Stone Carving',
    );

    test('create exhibit', () {
      final created = service.createExhibit(exhibitA);
      expect(created.id, equals(1));
    });

    test('createExhibit throws on duplicate id', () {
      expect(() => service.createExhibit(exhibitA), throwsArgumentError);
    });

    test('getExhibitsByGallery returns correct list', () {
      service.createExhibit(exhibitB);
      final list = service.getExhibitsByGallery(gallery);
      expect(list, hasLength(2));
      expect(list.map((e) => e.id), containsAll([1, 2]));
    });

    test('linkExhibits throws if an exhibit is missing', () {

      expect(
        () => service.linkExhibits(
          from: '99',
          to: '1',
          reason: 'NA',
          certainty: Certainty.theory,
        ),
        throwsArgumentError,
      );
    });
  });
}
