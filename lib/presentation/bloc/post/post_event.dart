import 'package:equatable/equatable.dart';

sealed class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetPostEvent extends PostEvent {}

final class CreatePostEvent extends PostEvent {}

final class UpdatePostEvent extends PostEvent {}

final class DeletePostEvent extends PostEvent {}
