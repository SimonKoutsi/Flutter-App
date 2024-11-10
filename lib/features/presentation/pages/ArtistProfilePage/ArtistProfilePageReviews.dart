// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/presentation/cubit/ReviewsCubit/reviews_cubit.dart';
import 'package:clean_project/features/presentation/widget/ReviewWidget/ReviewWidget.dart';
import 'package:flutter/material.dart';
import 'package:clean_project/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistProfilePageReviwes extends StatefulWidget {
  ArtistProfile artistsProfile;

  ArtistProfilePageReviwes({required this.artistsProfile});

  @override
  State<ArtistProfilePageReviwes> createState() =>
      _ArtistProfilePageReviwesState();
}

class _ArtistProfilePageReviwesState extends State<ArtistProfilePageReviwes> {
  late List<UserComment> reviewsList;

  @override
  Widget build(BuildContext context) {
    //With GestureDetector we dismiss the keyboard every time we click outside of it.
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocBuilder<ReviewsCubit, ReviewsState>(
        builder: (context, state) {
          if(state is StartingReviewsList){
            reviewsList= state.review;
            return _buildBody();                }
          else if (state is UpdatedReviewList){
            reviewsList= state.review;
            return _buildBody();
          }
          else if(state is ReviewsListWaiting){
            return CircularProgressIndicator();
          }
          else {
            return Text('Exception');
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    return Column(children: [
      Expanded(
          child: ListView.builder(
              itemCount: reviewsList.length,
              //With the following command we dismiss the keyboard every time we scroll.
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (context, index) => ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.5),
                      child: Text(
                        '@${reviewsList[index].userWhoCommented}',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    subtitle: Text(
                      reviewsList[index].comment,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    minVerticalPadding: 12,
                  ))),
      OutlinedButton.icon(
        icon: Icon(
          Icons.star_border_outlined,
          color: Color(0xFF5f1da1),
        ),
        label: Text(
          '    give us your opinion',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF5f1da1),
          ),
        ),
        //By using the async-await combo, the setState method awaits until the Navigator
        //'pops' the other page that the user had been navigated to and only then it sets the
        //new state
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => di.sl<ReviewsCubit>()..initReviewList(widget.artistsProfile.id),
              child: ReviewWidget(
                artistsProfileId: widget.artistsProfile.id,
              ),
            )
          ));
          await BlocProvider.of<ReviewsCubit>(context).updatedReviewlist(widget.artistsProfile.id, null);
        },
        style: OutlinedButton.styleFrom(
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.all(8),
          backgroundColor: Color(0xFF48e8b3),
          fixedSize: Size(double.maxFinite, 45),
          // ...in case i want circular corners...
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(15)
          // )
        ),
      ),
    ]);
  }
}
