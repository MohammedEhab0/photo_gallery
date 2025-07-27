import '../../models/photo_model.dart';

abstract class PhotoLocalDataSource {
  Future<List<PhotoModel>> getCachedPhotos();

  Future<void> cachePhotos(List<PhotoModel> photos);

  Future<void> clearCachedPhotos();
}
