import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/photo_repository.dart';
import '../datasources/remote/photo_remote_data_source.dart';
import '../models/photo_model.dart';


@Injectable(as: PhotoRepository)
class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource remoteDataSource;

  PhotoRepositoryImpl(this.remoteDataSource);

  Box<PhotoModel> get _photoBox => Hive.box<PhotoModel>('photosBox');

  @override
  Future<List<PhotoModel>> fetchPhotos() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final isOnline = connectivityResult != ConnectivityResult.none;

    if (isOnline) {
      try {
        final photos = await remoteDataSource.getCuratedPhotos();
        await _photoBox.clear();
        await _photoBox.addAll(photos);
        return photos;
      } on SocketException catch (_) {
        if (_photoBox.isNotEmpty) {
          return _photoBox.values.toList();
        }
        rethrow;
      }
    } else {
      if (_photoBox.isNotEmpty) {
        return _photoBox.values.toList();
      } else {
        throw Exception('No internet and no cached data available');
      }
    }
  }
}
