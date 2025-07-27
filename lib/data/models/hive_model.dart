import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/data/models/photo_model.dart';

@module
abstract class HiveModule {
  @Named('photosBox')
  @preResolve
  Future<Box<PhotoModel>> get photoBox async {
    return await Hive.openBox<PhotoModel>('photosBox');
  }
}
