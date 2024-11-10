
// ignore_for_file: camel_case_types, file_names


class UserComment {
  String comment;
  String userWhoCommented;

  UserComment({
    required this.comment,
    required this.userWhoCommented,

  });

}

class ListOfUserComments {
  List<UserComment> userCommentList;

  ListOfUserComments({required this.userCommentList});
}