import 'package:flutter_clean_architecture/data/repositories/comment_repo_impl.dart';
import 'package:flutter_clean_architecture/domain/use_cases/comment_usecase.dart';

class CommentUseCaseImpl extends CommentUseCase {
  CommentUseCaseImpl(this._repository);
  final CommentRepoImpl _repository;
  @override
  Future fetchComments(int id) => _repository.fetchComments(id);
}
