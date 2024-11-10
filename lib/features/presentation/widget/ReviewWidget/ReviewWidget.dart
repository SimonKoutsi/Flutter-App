// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/presentation/cubit/ReviewsCubit/reviews_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewWidget extends StatefulWidget {
  int artistsProfileId;

  ReviewWidget({required this.artistsProfileId});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  late List<UserComment> reviewsList;
  final controller = TextEditingController();

  Future<void> initreviewlist() async {
    await BlocProvider.of<ReviewsCubit>(context).initReviewList(widget.artistsProfileId);
  }

  Future<void> updatereviewlist(String? value) async {
    await BlocProvider.of<ReviewsCubit>(context).updatedReviewlist(widget.artistsProfileId, value);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    //With GestureDetector we dismiss the keyboard every time we click outside of it.
    return GestureDetector(
        onTap: () {
          return FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            elevation: 1,
            shadowColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Reviews',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          body: BlocBuilder<ReviewsCubit, ReviewsState>(
            builder: (context, state) {
              if(state is StartingReviewsList){
                reviewsList= state.review;
                return _buildBody();                
              }
              else if (state is UpdatedReviewList){
                reviewsList= state.review;
                return _buildBody();
              }
              else if(state is ReviewsListWaiting){
                return CircularProgressIndicator();
              }
              else {
                return Text('Exception', style: TextStyle(color: Colors.white),);
              }
            },
          ),
        ));
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
      TextField(
        controller: controller,
        onSubmitted: (value) => updatereviewlist(value),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFF48e8b3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: BorderSide.none,
          ),
          hintText: 'give your opinion',
          hintStyle: TextStyle(
            color: Color(0xFF5f1da1),
          ),
          prefixIcon: Icon(
            Icons.star_border_outlined,
            color: Color(0xFF5f1da1),
          ),
        ),
      ),
    ]);
  }
}
