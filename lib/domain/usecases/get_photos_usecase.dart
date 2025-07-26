
import 'package:photo_gallery/data/models/photo_model.dart';

import '../entities/photo_entity.dart';
import '../repositories/photo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPhotosUseCase {
  final PhotoRepository repository;

  GetPhotosUseCase(this.repository);

  Future<List<PhotoModel>> call() {
    return repository.fetchPhotos();
  }
}
