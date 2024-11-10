// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/UserProfile/UserProfile.dart';
import 'package:clean_project/features/presentation/cubit/EditUserProfileCubit/edit_user_profile_cubit.dart';
import 'package:clean_project/features/presentation/pages/UserProfilePage/UserProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  //This key will allow us to have access in the state of the "Form" widget.
  final formKey = GlobalKey<FormState>();
  late UserProfile userProfile;
  late String userProfileName;
  final snackBar= SnackBar(content: Text('Credentials Updated Successfully!!'));

  Future<void> updateUsersCredentials(UserProfile userProfile) async {
    await BlocProvider.of<EditUserProfileCubit>(context)
        .userProfileUpdate(userProfile);
  }

  void _submit() {
    final form = formKey.currentState!;

    //Unfocus keyboard when submit button is pressed.
    FocusScope.of(context).unfocus();

    //Credentials get updated only if validation is true
    if (form.validate()) {
      updateUsersCredentials(userProfile);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      //We notify the notifier in the 'UserProfilePage'
      UserProfilePage.username.value = userProfileName;
    }
  }

  @override
  Widget build(BuildContext context) {
    //With GestureDetector we dismiss the keyboard every time we click outside of it.
    return GestureDetector(
        onTap: () {
          return FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.white,
                  Color(0xFF5f1da1),
                  Color(0xFF48e8b3),
                ], stops: [
                  0.4,
                  0.75,
                  1
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: BlocBuilder<EditUserProfileCubit, EditUserProfileState>(
                builder: (context, state) {
                  if (state is WaitingEditUserProfile) {
                    userProfile= state.initCredentials;
                    return buildEditForm();
                  }
                  else if (state is EditUserProfileUpdated) {
                    return buildEditForm();
                  }
                  else {
                    return Text('Exception');
                  }
                },
              )),
        ));
  }

  Widget buildEditForm() {
    //The Form widget is usefull because it controlls every TextFormField that is its descendant.
    //In our case we have two TextFormField.
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.all(25),
        children: [
          SizedBox(
            height: 50,
          ),
          //The Field of the username
          TextFormField(
            initialValue: userProfile.username,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              labelText: 'Username',
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              //In a more realistic scenario, where we have a real data base, we would check if
              //the username that is provided is unigue
              if (value == null ||
                  value.length < 6 ||
                  value.contains(' ') ||
                  value.length > 26) {
                return 'Username must have at least 6 to 25 characters and no space';
              } else {
                userProfileName= value;
                userProfile.username = value;
                return null;
              }
            },
          ),
          SizedBox(
            height: 30,
          ),
          //The Field of the email.
          TextFormField(
            initialValue: userProfile.usersEmail,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              //In a more realistic scenario, where we have a real data base, we would check if
              //the email that is provided is unigue.
              if (value == null ||
                  value.contains(' ') ||
                  !value.contains('@') ||
                  value.length < 6) {
                return 'Invalid email, please see example "random@example.com"';
              } else {
                userProfile.usersEmail = value;
                return null;
              }
            },
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: _submit,
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 18, color: Color(0xFF48e8b3)),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              elevation: 0.0,
              fixedSize: Size(double.maxFinite, 40.0),
            ),
          ),
        ],
      ),
    );
  }
}
