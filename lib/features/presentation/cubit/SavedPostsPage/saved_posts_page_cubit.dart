import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/usecases/PostsUseCase/GetSavedPosts.dart';
import 'package:equatable/equatable.dart';

part 'saved_posts_page_state.dart';

class SavedPostsPageCubit extends Cubit<SavedPostsPageState> {
  final GetSavedPosts getSavedPosts;

  SavedPostsPageCubit({required this.getSavedPosts}) : super(SavedPostsPageInitial());

  Future<void> getSavedPostsList () async {
    emit(SavedPostsPageLoading());
    final LinkedHashSet<Posts> list = await getSavedPosts.call();
    emit(MainSavedPostsPage(savedposts: list));
  }}
