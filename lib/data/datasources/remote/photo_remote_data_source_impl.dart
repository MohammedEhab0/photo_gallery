import 'package:injectable/injectable.dart';

import '../../../core/api/ApiConstants.dart';
import '../../../core/api/ApiManager.dart';
import '../../models/photo_model.dart';
import 'photo_remote_data_source.dart';

@Injectable(as: PhotoRemoteDataSource)
class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  final ApiManager apiManager;

  PhotoRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<PhotoModel>> getCuratedPhotos() async {
    final response = await apiManager.getData(ApiConstants.curatedPath);
    final List photosJson = response.data['photos'];
    return photosJson.map((e) => PhotoModel.fromJson(e)).toList();
  }
}
