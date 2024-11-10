import 'package:clean_project/features/data/DataSources/DataSourcesArtistProfileRep/DataSourcesArtistProfileRep.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesArtistProfileRep/DataSourcesArtistProfileRepImpl.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesFollowRep/DataSourceFollowRepImpl.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesFollowRep/DataSourcesFollowRep.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesLikeButtonRep/DataSourcesLikeButtonRep.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesLikeButtonRep/DataSourcesLikeButtonRepImpl.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesPostsRep/DataSourcesPostListRepImpl.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesPostsRep/DataSourcesPostListRep.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesReviewsRep/DataSourcesReviewsRep.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesReviewsRep/DataSourcesReviewsRepImpl.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesUserCommentRep/DataSourcesUserCommentRep.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesUserCommentRep/DataSourcesUserCommentRepImpl.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesUserProfileRep/DataSourcesUserProfileRep.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesUserProfileRep/DataSourcesUserProfileRepImpl.dart';
import 'package:clean_project/features/data/Repositories/ArtistProfilesRepositoryImpl.dart';
import 'package:clean_project/features/data/Repositories/FollowRepositoryImpl.dart';
import 'package:clean_project/features/data/Repositories/LikeButtonRepositoryImpl.dart';
import 'package:clean_project/features/data/Repositories/PostListRepositoryImpl.dart';
import 'package:clean_project/features/data/Repositories/ReviewsRepositoryImpl.dart';
import 'package:clean_project/features/data/Repositories/UserCommentRepositoryImpl.dart';
import 'package:clean_project/features/data/Repositories/UserProfileRepositoryImpl.dart';
import 'package:clean_project/features/domain/repositories/ArtistProfile_Repository/ArtistProfile_repository.dart';
import 'package:clean_project/features/domain/repositories/Follow_Repository/FollowRepository.dart';
import 'package:clean_project/features/domain/repositories/LikeButton_Repository/LikeButtonRepository.dart';
import 'package:clean_project/features/domain/repositories/Post_Repository/PostListRepository.dart';
import 'package:clean_project/features/domain/repositories/Reviews_Repository/ReviewsRepository.dart';
import 'package:clean_project/features/domain/repositories/UserComment_Repository/UserCommentRepository.dart';
import 'package:clean_project/features/domain/repositories/UserProfile_Repository/UserProfileRepository.dart';
import 'package:clean_project/features/domain/usecases/FollowUseCase/FollowButtonAction.dart';
import 'package:clean_project/features/domain/usecases/FollowUseCase/FollowInit.dart';
import 'package:clean_project/features/domain/usecases/GetArtistProfilesUseCase/GetArtistProfile.dart';
import 'package:clean_project/features/domain/usecases/GetArtistProfilesUseCase/GetArtistProfilesInitList.dart';
import 'package:clean_project/features/domain/usecases/GetUsersFollowingListUseCase/GetUsersFollowingList.dart';
import 'package:clean_project/features/domain/usecases/LikeButtonUseCase/GetInitLikeButton.dart';
import 'package:clean_project/features/domain/usecases/LikeButtonUseCase/GetLikeButton.dart';
import 'package:clean_project/features/domain/usecases/PostsUseCase/GetFeedPagePosts.dart';
import 'package:clean_project/features/domain/usecases/PostsUseCase/GetLikedPosts.dart';
import 'package:clean_project/features/domain/usecases/PostsUseCase/GetSavedPosts.dart';
import 'package:clean_project/features/domain/usecases/ReviewsUseCase/GetInitReviewsListUseCase.dart';
import 'package:clean_project/features/domain/usecases/ReviewsUseCase/GetReviewsListUseCase.dart';
import 'package:clean_project/features/domain/usecases/UserCommentUseCase/GetInitUserCommentListUseCase.dart';
import 'package:clean_project/features/domain/usecases/UserCommentUseCase/GetUserCommentListUseCase.dart';
import 'package:clean_project/features/domain/usecases/UserProfileUseCase/GetInitUserProfile.dart';
import 'package:clean_project/features/domain/usecases/UserProfileUseCase/UpdateUserProfile.dart';
import 'package:clean_project/features/presentation/cubit/EditUserProfileCubit/edit_user_profile_cubit.dart';
import 'package:clean_project/features/presentation/cubit/FeedPageCubit/feed_page_cubit.dart';
import 'package:clean_project/features/presentation/cubit/FollowCubit/follow_cubit.dart';
import 'package:clean_project/features/presentation/cubit/LikeButtonCubit/like_button_cubit.dart';
import 'package:clean_project/features/presentation/cubit/LikedPostsPage/liked_posts_page_cubit.dart';
import 'package:clean_project/features/presentation/cubit/ReviewsCubit/reviews_cubit.dart';
import 'package:clean_project/features/presentation/cubit/SavedPostsPage/saved_posts_page_cubit.dart';
import 'package:clean_project/features/presentation/cubit/UserCommentCubit/user_comment_cubit.dart';
import 'package:clean_project/features/presentation/cubit/UsersFollowingPageCubit/users_following_page_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/data/DataSources/DataSourcesSaveButtonRep/DataSourcesSaveButtonRep.dart';
import 'features/data/DataSources/DataSourcesSaveButtonRep/DataSourcesSaveButtonRepImpl.dart';
import 'features/data/Repositories/SaveButtonRepositoryImpl.dart';
import 'features/domain/repositories/SaveButton_Repository/SaveButtonRepository.dart';
import 'features/domain/usecases/SaveButtonUseCase/GetInitSaveButton.dart';
import 'features/domain/usecases/SaveButtonUseCase/GetSaveButton.dart';
import 'features/presentation/cubit/SaveButtonCubit/save_button_cubit.dart';
import 'features/presentation/cubit/SearchCubit/search_cubit.dart';

final sl= GetIt.instance;

void init () {

  //Cubits
  sl.registerFactory(
    () => SearchCubit(
      getArtistProfileUseCase: sl.call(),
      getArtistProfilesInitListUseCase: sl.call(),
    )
  );

  sl.registerFactory(
    () => FollowCubit(
      followInitUseCase: sl.call(), 
      followButtonActiongUseCase: sl.call()
    )
  );

  sl.registerFactory(
    () => FeedPageCubit(
      getFeedPagePosts: sl.call(),
    )
  );

  sl.registerFactory(
    () => LikeButtonCubit(
      getInitLikeButton: sl.call(),
      getLikeButton: sl.call()
    )
  );

  sl.registerFactory(
    () => SaveButtonCubit(
      getInitSaveButton: sl.call(),
      getSaveButton: sl.call()
    )
  );

  sl.registerFactory(
    () => UserCommentCubit(
      getInitUserCommentList: sl.call(),
      getUserCommentList: sl.call()
    )
  );

  sl.registerFactory(
    () => ReviewsCubit(
      getInitReviewsList: sl.call(),
      getReviewsList: sl.call(),
    )
  );

  sl.registerFactory(
    () => UsersFollowingPageCubit(
      getUsersFollowingListUseCase: sl.call(),
    )
  );

  sl.registerFactory(
    () => LikedPostsPageCubit(
      getLikedPosts: sl.call(),
    )
  );

  sl.registerFactory(
    () => SavedPostsPageCubit(
      getSavedPosts: sl.call(),
    )
  );

  sl.registerFactory(
    () => EditUserProfileCubit(
      updateUserProfile: sl.call(),
      getInitUserProfile: sl.call(),
    )
  );

  //Use Cases

    //Get Artist Profile
    sl.registerLazySingleton(() => GetArtistProfileUseCase(sl.call()));
    sl.registerLazySingleton(() => GetArtistProfilesInitListUseCase(sl.call()));

    //Follow    
    sl.registerLazySingleton(() => FollowInitUseCase(repository: sl.call()));
    sl.registerLazySingleton(() => FollowButtonActiongUseCase(repository: sl.call()));

    //Feed Page
    sl.registerLazySingleton(() => GetFeedPagePosts(repository: sl.call()));

    //Like Button
    sl.registerLazySingleton(() => GetInitLikeButton(repository: sl.call()));
    sl.registerLazySingleton(() => GetLikeButton(repository: sl.call()));

    //Save Button
    sl.registerLazySingleton(() => GetInitSaveButton(repository: sl.call()));
    sl.registerLazySingleton(() => GetSaveButton(repository: sl.call()));

    //User Comment
    sl.registerLazySingleton(() => GetInitUserCommentList(repository: sl.call()));
    sl.registerLazySingleton(() => GetUserCommentList(repository: sl.call()));

    //Reviews
    sl.registerLazySingleton(() => GetInitReviewsList(repository: sl.call()));
    sl.registerLazySingleton(() => GetReviewsList(repository: sl.call()));

    //Users Following Page
    sl.registerLazySingleton(() => GetUsersFollowingListUseCase(repository: sl.call()));

    //Users Liked Posts Page
    sl.registerLazySingleton(() => GetLikedPosts(repository: sl.call()));

    //Users Saved Posts Page
    sl.registerLazySingleton(() => GetSavedPosts(repository: sl.call()));

    //Edit User Profile Page
    sl.registerLazySingleton(() => UpdateUserProfile(repository: sl.call()));
    sl.registerLazySingleton(() => GetInitUserProfile(repository: sl.call()));



  //Repository

    //Artist Profile and Users Following Page
    sl.registerLazySingleton<ArtistProfileRepository>(() => ArtistProfileRepositoryImpl(dataSource: sl.call()));
    sl.registerLazySingleton<DataSourcesArtistProfileRep>(() => DataSourcesArtistProfileRepImpl());

    //Follow
    sl.registerLazySingleton<FollowRepository>(() => FollowRepositoryImpl(dataSources: sl.call()));
    sl.registerLazySingleton<DataSourcesFollowRepository>(() => DataSourceFollowRepositoryImpl());

    //Feed Page, Liked Posts Page and Saved Posts Page
    sl.registerLazySingleton<PostListRepository>(() => PostListRepositoryImpl(dataSources: sl.call()));
    sl.registerLazySingleton<DataSourcesPostListRepository>(() => DataSourcesPostListRepImpl());

    //Like Button
    sl.registerLazySingleton<LikeButtonRepository>(() => LikeButtonRepositoryImpl(dataSources: sl.call()));
    sl.registerLazySingleton<DataSourcesLikeButtonRepository>(() => DataSourcesLikeButtonRepImpl());

    //Save Button
    sl.registerLazySingleton<SaveButtonRepository>(() => SaveButtonRepositoryImpl(dataSources: sl.call()));
    sl.registerLazySingleton<DataSourcesSaveButtonRepository>(() => DataSourcesSaveButtonRepImpl());

    //User Comment
    sl.registerLazySingleton<UserCommentRepository>(() => UserCommentRepositoryImpl(dataSources: sl.call()));
    sl.registerLazySingleton<DataSourcesUserCommentRepository>(() => DataSourcesUserCommentRepImpl()); 

    //Reviews
    sl.registerLazySingleton<ReviewsRepository>(() => ReviewsRepositoryImpl(dataSources: sl.call()));
    sl.registerLazySingleton<DataSourcesReviewsRepository>(() => DataSourcesReviewsRepImpl());   
  
    //User Profile
    sl.registerLazySingleton<UserProfileRepository>(() => UserProfileRepositoryImpl(dataSources: sl.call()));
    sl.registerLazySingleton<DataSourcesUserProfileRepository>(() => DataSourcesUserProfileRepImpl());   

  }