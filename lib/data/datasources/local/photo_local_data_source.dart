import '../../models/photo_model.dart';

/// Abstract class defining the contract for local data operations.
/// Specifies methods for getting, caching, and clearing photos locally.
abstract class PhotoLocalDataSource {
  /// Retrieve cached photos (if available).
  Future<List<PhotoModel>> getCachedPhotos();

  /// Save a new list of photos to cache.
  Future<void> cachePhotos(List<PhotoModel> photos);

  /// Clear all cached photo data.
  Future<void> clearCachedPhotos();
}
