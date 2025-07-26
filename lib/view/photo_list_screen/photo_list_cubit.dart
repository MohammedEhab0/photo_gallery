import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/photo_repository.dart';
import 'photo_list_state.dart';
import '../../data/models/photo_model.dart';

import 'package:injectable/injectable.dart';

@injectable
class PhotoListCubit extends Cubit<PhotoListState> {
  final PhotoRepository photoRepository;

  PhotoListCubit(this.photoRepository) : super(PhotoListInitial());

  Future<void> loadPhotos() async {
    emit(PhotoListLoading());

    try {
      final photos = await photoRepository.fetchPhotos();
      final isOnline = photos.isNotEmpty ; // optional check

      emit(PhotoListLoaded(photos: photos, isOnline: isOnline));
    } catch (e) {
      emit(PhotoListError(e.toString()));
    }
  }
}
