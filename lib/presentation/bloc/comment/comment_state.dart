import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/domain/entities/comment.dart';

enum CommentStatus { initial, loading, loaded, error }

final class CommentState extends Equatable {
  final CommentStatus status;
  final List<Comment> comments;
  final String message;

  const CommentState({
    this.status = CommentStatus.initial,
    this.comments = const [],
    this.message = '',
  });

  CommentState copyWith({
    CommentStatus? status,
    List<Comment>? comments,
    String? message,
  }) {
    return CommentState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, comments, message];

  @override
  String toString() {
    return '''CommentState { status: $status, comments: ${comments.length}, errorMessage: $message }''';
  }
}