// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:photo_gallery/core/api/ApiManager.dart' as _i533;
import 'package:photo_gallery/data/datasources/local/photo_local_data_source.dart'
    as _i544;
import 'package:photo_gallery/data/datasources/local/photo_local_data_source_impl.dart'
    as _i880;
import 'package:photo_gallery/data/datasources/remote/photo_remote_data_source.dart'
    as _i221;
import 'package:photo_gallery/data/datasources/remote/photo_remote_data_source_impl.dart'
    as _i713;
import 'package:photo_gallery/data/models/hive_model.dart' as _i1045;
import 'package:photo_gallery/data/models/photo_model.dart' as _i1053;
import 'package:photo_gallery/data/repositories/photo_repository_impl.dart'
    as _i669;
import 'package:photo_gallery/domain/repositories/photo_repository.dart'
    as _i624;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final hiveModule = _$HiveModule();
    gh.lazySingleton<_i221.PhotoRemoteDataSource>(
        () => _i713.PhotoRemoteDataSourceImpl(gh<_i533.ApiManager>()));
    await gh.factoryAsync<_i979.Box<_i1053.PhotoModel>>(
      () => hiveModule.photoBox,
      instanceName: 'photosBox',
      preResolve: true,
    );
    gh.lazySingleton<_i544.PhotoLocalDataSource>(() =>
        _i880.PhotoLocalDataSourceImpl(
            gh<_i979.Box<_i1053.PhotoModel>>(instanceName: 'photosBox')));
    gh.lazySingleton<_i624.PhotoRepository>(() => _i669.PhotoRepositoryImpl(
          remoteDataSource: gh<_i221.PhotoRemoteDataSource>(),
          localDataSource: gh<_i544.PhotoLocalDataSource>(),
        ));
    return this;
  }
}

class _$HiveModule extends _i1045.HiveModule {}
