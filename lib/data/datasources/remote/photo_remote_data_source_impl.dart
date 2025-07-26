// data/data_sources/remote/photo_remote_data_source_impl.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/ApiConstants.dart';
import '../../../core/api/ApiManager.dart';

import '../../models/photo_model.dart';
import 'photo_remote_data_source.dart';

@LazySingleton(as: PhotoRemoteDataSource)
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
