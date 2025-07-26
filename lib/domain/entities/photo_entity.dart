// domain/entities/photo_entity.dart

class PhotoEntity {
  final int id;
  final String photographer;
  final String imageUrl;
  final String alt;

  const PhotoEntity({
    required this.id,
    required this.photographer,
    required this.imageUrl,
    required this.alt,
  });
}
