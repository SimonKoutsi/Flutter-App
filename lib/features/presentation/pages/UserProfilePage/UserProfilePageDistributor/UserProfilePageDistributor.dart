// ignore_for_file: file_names

import 'package:clean_project/features/presentation/cubit/EditUserProfileCubit/edit_user_profile_cubit.dart';
import 'package:clean_project/features/presentation/cubit/LikedPostsPage/liked_posts_page_cubit.dart';
import 'package:clean_project/features/presentation/cubit/SavedPostsPage/saved_posts_page_cubit.dart';
import 'package:clean_project/features/presentation/cubit/UsersFollowingPageCubit/users_following_page_cubit.dart';
import 'package:clean_project/features/presentation/pages/UserProfilePage/UserProfilePageDistributor/EditUserProfilePage/EditProfilePage.dart';
import 'package:clean_project/features/presentation/pages/UserProfilePage/UserProfilePageDistributor/FollowingPage/FollowingPage.dart';
import 'package:clean_project/features/presentation/pages/UserProfilePage/UserProfilePageDistributor/LikedPostsPage/LikedPostsPage.dart';
import 'package:clean_project/features/presentation/pages/UserProfilePage/UserProfilePageDistributor/SavedPostsPage/SavedPostsPage.dart';
import 'package:flutter/material.dart';
import 'package:clean_project/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

//I made this widget just to make the "userProfilePage' look more compact (look cleaner).
class UserProfilePageDistributor extends StatelessWidget {
  final int index;

  const UserProfilePageDistributor({required this.index});

  Widget page() {
    switch (index) {
      case 0:
        return BlocProvider(
          create: (context) => di.sl<EditUserProfileCubit>()..getInitProfileCredential(),
          child: EditProfilePage(),
        );
      case 1:
        return BlocProvider(
          create: (context) => di.sl<UsersFollowingPageCubit>()..getUsersFollowinList(),
          child: FollowingPage(),
        );
      case 2:
        return BlocProvider(
          create: (context) => di.sl<LikedPostsPageCubit>()..getLikedPostsList(),
          child: LikedPostsPage(),
        );
      default:
        return BlocProvider(
          create: (context) => di.sl<SavedPostsPageCubit>()..getSavedPostsList(),
          child: SavedPostsPage(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return page();
  }
}
