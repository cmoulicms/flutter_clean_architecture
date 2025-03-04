import 'package:flutter_clean_architecture/data/data_sources/comment_data_source.dart';
import 'package:flutter_clean_architecture/data/data_sources/post_data_source.dart';
import 'package:flutter_clean_architecture/data/repositories/comment_repo_impl.dart';
import 'package:flutter_clean_architecture/data/repositories/post_repo_impl.dart';
import 'package:flutter_clean_architecture/domain/use_cases/comment_usecase_impl.dart';
import 'package:flutter_clean_architecture/domain/use_cases/post_usecase_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerLazySingleton(() => PostDataSourceImpl());
  getIt.registerLazySingleton(() => PostRepoImpl(postDataSource: getIt()));
  getIt.registerLazySingleton(() => PostUseCaseImpl(getIt()));

  getIt.registerLazySingleton(() => CommentDataSourceImpl());
  getIt
      .registerLazySingleton(() => CommentRepoImpl(commentDataSource: getIt()));
  getIt.registerLazySingleton(() => CommentUseCaseImpl(getIt()));
}
