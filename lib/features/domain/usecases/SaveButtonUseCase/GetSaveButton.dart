
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/SaveButton/SaveButton.dart';
import 'package:clean_project/features/domain/repositories/SaveButton_Repository/SaveButtonRepository.dart';

class GetSaveButton {
  final SaveButtonRepository repository;

  const GetSaveButton({required this.repository});

  Future<SaveButton> call(Posts post ,bool isSaved) async {
    return await repository.getSaveButton(post, isSaved);
  }
}