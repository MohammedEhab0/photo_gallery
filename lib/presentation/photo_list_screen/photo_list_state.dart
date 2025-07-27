import 'package:equatable/equatable.dart';

import '../../data/models/photo_model.dart';

abstract class PhotoListState extends Equatable {
  final bool isOnline;

  const PhotoListState({this.isOnline = true});

  @override
  List<Object?> get props => [isOnline];
}

class PhotoListInitial extends PhotoListState {
  const PhotoListInitial({super.isOnline});

  @override
  List<Object?> get props => [super.isOnline];
}

class PhotoListLoading extends PhotoListState {
  const PhotoListLoading({super.isOnline});

  @override
  List<Object?> get props => [super.isOnline];
}

class PhotoListLoaded extends PhotoListState {
  final List<PhotoModel> photos;

  const PhotoListLoaded({required this.photos, required super.isOnline});

  @override
  List<Object?> get props => [photos, super.isOnline];
}

class PhotoListError extends PhotoListState {
  final String message;

  const PhotoListError(this.message, {super.isOnline});

  @override
  List<Object?> get props => [message, super.isOnline];
}
