import 'package:flutter_clean_architecture/data/repositories/post_repo_impl.dart';
import 'package:flutter_clean_architecture/domain/entities/post.dart';
import 'package:flutter_clean_architecture/domain/use_cases/post_usecase.dart';

class PostUseCaseImpl extends PostUseCase {
  PostUseCaseImpl(this._repository);
  final PostRepoImpl _repository;
  @override
  Future createPost() => _repository.createPost();

  @override
  Future deletePost() => _repository.deletePost();

  @override
  Future<List<Post>> fetchPosts() => _repository.fetchPosts();

  @override
  Future updatePost() => _repository.updatePost();
}
