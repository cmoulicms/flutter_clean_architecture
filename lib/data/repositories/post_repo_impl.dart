import 'package:flutter_clean_architecture/data/data_sources/post_data_source.dart';
import 'package:flutter_clean_architecture/data/models/post_model.dart';
import 'package:flutter_clean_architecture/domain/entities/post.dart';
import 'package:flutter_clean_architecture/domain/repositories/post_repo.dart';

class PostRepoImpl extends PostRepo {
  final PostDataSourceImpl postDataSource;

  PostRepoImpl({required this.postDataSource});

  @override
  Future createPost() {
    return postDataSource.createPost();
  }

  @override
  Future deletePost() {
    return postDataSource.deletePost();
  }

  @override
  Future<List<Post>> fetchPosts() async {
    final result = await postDataSource.fetchPosts();
    return (result as List)
        .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future updatePost() {
    return postDataSource.updatePost();
  }
}
