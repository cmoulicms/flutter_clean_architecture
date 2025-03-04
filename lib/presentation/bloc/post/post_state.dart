import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/domain/entities/post.dart';

enum PostStatus { initial, loading, loaded, error }

final class PostState extends Equatable {
  final PostStatus status;
  final List<Post> posts;
  final String message;

  const PostState({
    this.status = PostStatus.initial,
    this.posts = const [],
    this.message = '',
  });

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    String? message,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, posts, message];

  @override
  String toString() {
    return '''PostState { status: $status, posts: ${posts.length}, errorMessage: $message }''';
  }
}
