import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/entities/post.dart';
import 'package:flutter_clean_architecture/presentation/pages/comment_screen.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key, required this.posts});

  final Post posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: Column(
        spacing: 5,
        children: [
          Card(
            child: ListTile(
              title: Text('ID: ${posts.title}'),
              subtitle: Text('User ID: ${posts.body}'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommentScreen(id: posts.id)));
              },
              child: Text('Get Comments'))
        ],
      ),
    );
  }
}
