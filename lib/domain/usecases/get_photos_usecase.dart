// domain/usecases/get_photos_usecase.dart

import '../entities/photo_entity.dart';
import '../repositories/photo_repository.dart';

class GetPhotosUseCase {
  final PhotoRepository repository;

  GetPhotosUseCase(this.repository);

  Future<List<PhotoEntity>> call() {
    return repository.getPhotos();
  }
}
