import 'package:flutter_clean_architecture/data/data_sources/comment_data_source.dart';
import 'package:flutter_clean_architecture/data/models/comment_model.dart';
import 'package:flutter_clean_architecture/domain/entities/comment.dart';
import 'package:flutter_clean_architecture/domain/repositories/comment_repo.dart';

class CommentRepoImpl  extends CommentRepo{
  final CommentDataSourceImpl commentDataSource;

  CommentRepoImpl({required this.commentDataSource});
  
  @override
  Future<List<Comment>> fetchComments(int id) async{
    final result = await commentDataSource.fetchComments(id);
    return (result as List)
        .map((json) => CommentModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}