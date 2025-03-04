abstract class PostRepo {
  Future fetchPosts();

  Future createPost();

  Future updatePost();

  Future deletePost();
}