
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/SaveButton/SaveButton.dart';
import 'package:clean_project/features/domain/repositories/SaveButton_Repository/SaveButtonRepository.dart';

class GetInitSaveButton {
  final SaveButtonRepository repository;

  const GetInitSaveButton({required this.repository});

  Future<SaveButton> call(Posts post) async {
    return await repository.getInitSaveButton(post);
  }
}