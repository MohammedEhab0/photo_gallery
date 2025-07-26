// data/data_sources/remote/photo_remote_data_source.dart
import '../../models/photo_model.dart';

abstract class PhotoRemoteDataSource {
  Future<List<PhotoModel>> getCuratedPhotos();
}
