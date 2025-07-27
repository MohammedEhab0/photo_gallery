import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/photo_repository.dart';
import 'photo_list_state.dart';

@injectable
class PhotoListCubit extends Cubit<PhotoListState> {
  final PhotoRepository photoRepository;
  final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  bool _currentIsOnline = true;

  PhotoListCubit(this.photoRepository, this._connectivity)
      : super(const PhotoListInitial(isOnline: true)) {
    _initConnectivityListener();
  }

  Future<void> _initConnectivityListener() async {
    final initialResult = await _connectivity.checkConnectivity();
    _updateConnectivityStatus(initialResult);

    if (!_currentIsOnline && state is PhotoListInitial) {
      emit(const PhotoListInitial(isOnline: false));
    }

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      final bool wasOnline = _currentIsOnline;
      _updateConnectivityStatus(result);

      if (!wasOnline && _currentIsOnline) {
        loadPhotos();
      } else {
        _reEmitCurrentStateWithUpdatedConnectivity();
      }
    });
  }

  void _updateConnectivityStatus(ConnectivityResult result) {
    _currentIsOnline = (result != ConnectivityResult.none);
  }

  void _reEmitCurrentStateWithUpdatedConnectivity() {
    final currentState = state;
    if (currentState is PhotoListLoaded) {
      emit(PhotoListLoaded(
          photos: currentState.photos, isOnline: _currentIsOnline));
    } else if (currentState is PhotoListLoading) {
      emit(PhotoListLoading(isOnline: _currentIsOnline));
    } else if (currentState is PhotoListError) {
      emit(PhotoListError(currentState.message, isOnline: _currentIsOnline));
    }
  }

  Future<void> loadPhotos() async {
    emit(PhotoListLoading(isOnline: _currentIsOnline));

    try {
      final photos = await photoRepository.fetchPhotos();

      emit(PhotoListLoaded(photos: photos, isOnline: _currentIsOnline));
    } catch (e) {
      emit(PhotoListError(e.toString(), isOnline: _currentIsOnline));
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
