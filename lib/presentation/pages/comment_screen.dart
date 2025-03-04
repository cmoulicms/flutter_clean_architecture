import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/bloc/comment/comment_bloc.dart';
import 'package:flutter_clean_architecture/presentation/bloc/comment/comment_event.dart';
import 'package:flutter_clean_architecture/presentation/bloc/comment/comment_state.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.id});
  final int id;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CommentBloc>().add(GetCommentEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
        if (state.status == CommentStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == CommentStatus.error) {
          return Center(child: Text(state.message));
        } else if (state.status == CommentStatus.loaded) {
          return ListView.builder(
            itemCount: state.comments.length,
            itemBuilder: (context, index) {
              return Column(
                spacing: 10,
                children: [
                  Card(
                    child: ListTile(
                      title: Text(state.comments[index].name),
                      subtitle: Text(state.comments[index].email),
                      leading: Text('ID: ${state.comments[index].id}'),
                    ),
                  ),
                ],
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
