import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../models/photo_model.dart';
import 'photo_local_data_source.dart';

@LazySingleton(as: PhotoLocalDataSource)
class PhotoLocalDataSourceImpl implements PhotoLocalDataSource {
  final Box<PhotoModel> _photoBox;

  PhotoLocalDataSourceImpl(@Named('photosBox') this._photoBox);

  /// Returns cached photos from Hive or an empty list if none exist.
  @override
  Future<List<PhotoModel>> getCachedPhotos() async {
    return _photoBox.values.toList();
  }

  /// Clears the existing cache and stores the new list of photos.
  @override
  Future<void> cachePhotos(List<PhotoModel> photos) async {
    await _photoBox.clear();
    await _photoBox.addAll(photos);
  }

  /// Completely clears the photo cache.
  @override
  Future<void> clearCachedPhotos() async {
    await _photoBox.clear();
  }
}
