import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class PostDataSource {
  Future fetchPosts();

  Future createPost();

  Future updatePost();

  Future deletePost();
}

class PostDataSourceImpl extends PostDataSource {
  @override
  Future createPost() {
    return Future.value();
  }

  @override
  Future deletePost() {
    return Future.value();
  }

  @override
  Future fetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      return jsonDecode(response.body);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }

  @override
  Future updatePost() {
    return Future.value();
  }
}
