import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class CommentDataSource {
  Future fetchComments(int id);
}

class CommentDataSourceImpl extends CommentDataSource {
  @override
  Future fetchComments(int id) async {
    try {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/$id/comments'));
      return jsonDecode(response.body);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }
}
