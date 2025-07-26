import 'package:equatable/equatable.dart';
import '../../data/models/photo_model.dart';

abstract class PhotoListState extends Equatable {
  const PhotoListState();

  @override
  List<Object?> get props => [];
}

class PhotoListInitial extends PhotoListState {}

class PhotoListLoading extends PhotoListState {}

class PhotoListLoaded extends PhotoListState {
  final List<PhotoModel> photos;
  final bool isOnline;

  const PhotoListLoaded({required this.photos, required this.isOnline});

  @override
  List<Object?> get props => [photos, isOnline];
}

class PhotoListError extends PhotoListState {
  final String message;

  const PhotoListError(this.message);

  @override
  List<Object?> get props => [message];
}
