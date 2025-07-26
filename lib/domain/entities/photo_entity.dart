class PhotoEntity {
  final int id;
  final String photographer;
  final String originalUrl;
  final String mediumUrl;
  final String alt;

  PhotoEntity({
    required this.id,
    required this.photographer,
    required this.originalUrl,
    required this.mediumUrl,
    required this.alt,
  });
}
