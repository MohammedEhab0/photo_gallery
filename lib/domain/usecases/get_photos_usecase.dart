
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/data/models/photo_model.dart';

import '../repositories/photo_repository.dart';

@injectable
class GetPhotosUseCase {
  final PhotoRepository repository;

  GetPhotosUseCase(this.repository);

  Future<List<PhotoModel>> call() {
    return repository.fetchPhotos();
  }
}
