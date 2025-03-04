import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/post.dart';
import 'package:flutter_clean_architecture/domain/use_cases/post_usecase_impl.dart';
import 'package:flutter_clean_architecture/presentation/bloc/post/post_event.dart';
import 'package:flutter_clean_architecture/presentation/bloc/post/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostUseCaseImpl postUseCase;
  PostBloc(this.postUseCase) : super(PostState()) {
    on<GetPostEvent>(
      (event, emit) async {
        emit(state.copyWith(status: PostStatus.loading));
        try {
          final List<Post> posts = await postUseCase.fetchPosts();
          
          emit(state.copyWith(status: PostStatus.loaded, posts: posts));
        } catch (e) {
          emit(state.copyWith(status: PostStatus.error, message: e.toString()));
        }
      },
    );

    on<CreatePostEvent>(
      (event, emit) {},
    );

    on<UpdatePostEvent>(
      (event, emit) {},
    );

    on<DeletePostEvent>(
      (event, emit) {},
    );
  }
}
