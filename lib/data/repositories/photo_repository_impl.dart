// data/repositories/photo_repository_impl.dart

import 'package:injectable/injectable.dart';
import '../../domain/entities/photo_entity.dart';
import '../../domain/repositories/photo_repository.dart';
import '../datasources/local/photo_local_data_source.dart';
import '../datasources/remote/photo_remote_data_source.dart';

@LazySingleton(as: PhotoRepository)
class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource remoteDataSource;
  final PhotoLocalDataSource localDataSource;

  PhotoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<PhotoEntity>> getPhotos() async {
    try {
      // Try to get remote data first
      final photos = await remoteDataSource.getCuratedPhotos();
      await localDataSource.cachePhotos(photos);

      return photos.map((e) => PhotoEntity(
        id: e.id,
        photographer: e.photographer,
        imageUrl: e.src.medium,
        alt: e.alt,
      )).toList();
    } catch (e) {
      // Fallback to local if offline or error occurs
      final cachedPhotos = await localDataSource.getCachedPhotos();

      return cachedPhotos.map((e) => PhotoEntity(
        id: e.id,
        photographer: e.photographer,
        imageUrl: e.src.medium,
        alt: e.alt,
      )).toList();
    }
  }
}
