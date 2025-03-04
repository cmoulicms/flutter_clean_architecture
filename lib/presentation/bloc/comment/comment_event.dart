import 'package:equatable/equatable.dart';

sealed class CommentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetCommentEvent extends CommentEvent {
  final int id;
  GetCommentEvent(this.id);

  @override
  List<Object> get props => [id];
}
