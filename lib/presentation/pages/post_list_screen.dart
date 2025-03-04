import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/bloc/post/post_bloc.dart';
import 'package:flutter_clean_architecture/presentation/bloc/post/post_event.dart';
import 'package:flutter_clean_architecture/presentation/bloc/post/post_state.dart';
import 'package:flutter_clean_architecture/presentation/pages/post_screen.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(GetPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ElevatedButton(onPressed: () {}, child: Text('Create Post'))],
        title: const Text('Posts List'),
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state.status == PostStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == PostStatus.error) {
          return Center(child: Text(state.message));
        } else if (state.status == PostStatus.loaded) {
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PostScreen(posts: state.posts[index])));
                },
                child: Card(
                  child: ListTile(
                    leading: Text(state.posts[index].id.toString()),
                    title: Text(state.posts[index].title),
                    subtitle: Text(state.posts[index].body),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('No data'));
        }
      }),
    );
  }
}
