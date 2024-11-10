// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/entities/Follow/Follow.dart';
import 'package:clean_project/features/presentation/cubit/FollowCubit/follow_cubit.dart';
import 'package:clean_project/features/presentation/cubit/ReviewsCubit/reviews_cubit.dart';
import 'package:clean_project/features/presentation/pages/ArtistProfilePage/ArtistProfilePagePosts.dart';
import 'package:clean_project/features/presentation/pages/ArtistProfilePage/ArtistProfilePageReviews.dart';
import 'package:clean_project/features/presentation/widget/AboutButton/AboutButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_project/injection_container.dart' as di;

class ArtistsProfilePage extends StatefulWidget {
  final ArtistProfile artistProfiledata;

  const ArtistsProfilePage({Key? key, required this.artistProfiledata})
      : super(key: key);

  @override
  State<ArtistsProfilePage> createState() => _ArtistsProfilePageState();
}

class _ArtistsProfilePageState extends State<ArtistsProfilePage> {
  Follow followEntity = Follow(followers: '???', following: false, followButtonText: '???');

  @override
  void initState() {
    super.initState();
    initFollowButton(widget.artistProfiledata);
  }

  void initFollowButton(ArtistProfile artistProfile) async {
    await BlocProvider.of<FollowCubit>(context).initFollow(artistProfile);
  }

  void followButtonAction(ArtistProfile artistProfile, bool isfollowing) async {
    await BlocProvider.of<FollowCubit>(context).followAction(artistProfile, isfollowing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '@${widget.artistProfiledata.dummyProfileName}',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      //We wrap the whole body with the DefaultTabController in order to use and manage the
      //TabBar and the TabView (Line 143, 154)
      body: DefaultTabController(
          length: 2,
          //NestedScrollView allows us to keep a scrollable widget inside onother scrollable widget.
          //In our case we have the scrollable TabView but we wanted the whole page to be scrollable.
          child: NestedScrollView(
              headerSliverBuilder: (context, _) {
                return [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(9.0),
                          child: Row(
                            children: [
                              //profile image
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 150.0,
                                width: 150.0,

                                //I put a second container inside a container in order to be able to align the image
                                child: Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: widget
                                          .artistProfiledata.dummyProfilePhoto,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: BlocBuilder<FollowCubit, FollowState>(
                                  builder: (context, state) {
                                    if (state is FollowInitial) {
                                      return CircularProgressIndicator();
                                    } 
                                    else if (state is FollowButtonInitial) {
                                      followEntity = state.followEntity;
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            followEntity.followers,
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6.0,
                                          ),
                                          Text(
                                            'Followers',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 21,
                                          ),
                                          Row(
                                            children: [
                                              //follow button
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  child: ElevatedButton(
                                                    onPressed: () => followButtonAction(widget.artistProfiledata, followEntity.following),
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Color(0xFF7208fc),
                                                      elevation: 5.0,
                                                      fixedSize: Size(110.0, 35.0),
                                                    ),
                                                    child: Text(
                                                        followEntity.followButtonText,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                        )),
                                                  ),
                                                ),
                                              ),

                                              //about button
                                              Expanded(
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    height: 35,
                                                    child: AboutButton()),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    } 
                                    else {
                                      return Text("Exception");
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        //"Short bio" area. At this stage is sample text.
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'some short bio :)',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ]))
                ];
              },
              body: Column(
                children: [
                  TabBar(tabs: [
                    Tab(
                      icon: Icon(
                        Icons.grid_3x3_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                        icon: Icon(
                      Icons.reviews_outlined,
                      color: Colors.white,
                    )),
                  ]),
                  Expanded(
                      child: TabBarView(
                    children: [
                      ArtistProfilePAgePosts(
                        profileData: widget.artistProfiledata,
                      ),
                      BlocProvider(
                        create: (context) => di.sl<ReviewsCubit>()..initReviewList(widget.artistProfiledata.id),
                        child: ArtistProfilePageReviwes(
                          artistsProfile: widget.artistProfiledata,
                        ),
                      ),
                    ],
                  )),
                ],
              ))),
    );
  }
}
