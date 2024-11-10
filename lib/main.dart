import 'package:clean_project/features/presentation/cubit/SearchCubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/presentation/cubit/FeedPageCubit/feed_page_cubit.dart';
import 'features/presentation/cubit/FollowCubit/follow_cubit.dart';
import 'features/presentation/pages/HomePage/HomePage.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<SearchCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<FollowCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<FeedPageCubit>()..initFeedPage(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
