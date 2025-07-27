import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../models/photo_model.dart';
import 'photo_local_data_source.dart';

@Injectable(as: PhotoLocalDataSource)
class PhotoLocalDataSourceImpl implements PhotoLocalDataSource {
  final Box<PhotoModel> _photoBox;

  PhotoLocalDataSourceImpl(@Named('photosBox') this._photoBox);

  @override
  Future<List<PhotoModel>> getCachedPhotos() async {
    return _photoBox.values.toList();
  }

  @override
  Future<void> cachePhotos(List<PhotoModel> photos) async {
    await _photoBox.clear();
    await _photoBox.addAll(photos);
  }

  @override
  Future<void> clearCachedPhotos() async {
    await _photoBox.clear();
  }
}
