import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/comment.dart';
import 'package:flutter_clean_architecture/domain/use_cases/comment_usecase_impl.dart';
import 'package:flutter_clean_architecture/presentation/bloc/comment/comment_event.dart';
import 'package:flutter_clean_architecture/presentation/bloc/comment/comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentUseCaseImpl commentUseCase;

  CommentBloc(this.commentUseCase) : super(CommentState()) {
    on<GetCommentEvent>(
      (event, emit) async {
        emit(state.copyWith(status: CommentStatus.loading));
        try {
          final List<Comment> comments =
              await commentUseCase.fetchComments(event.id);
          emit(
              state.copyWith(status: CommentStatus.loaded, comments: comments));
        } catch (e) {
          emit(state.copyWith(
              status: CommentStatus.error, message: e.toString()));
        }
      },
    );
  }
}
