import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/data/models/photo_model.dart';


@module
abstract class HiveModule {
  /// Provide Hive box for storing PhotoModel objects.
  @Named('photosBox')
  @preResolve
  Future<Box<PhotoModel>> get photoBox => Hive.openBox<PhotoModel>('photos');
}
