
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesSaveButtonRep/DataSourcesSaveButtonRep.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/SaveButton/SaveButton.dart';
import 'package:clean_project/features/domain/repositories/SaveButton_Repository/SaveButtonRepository.dart';

class SaveButtonRepositoryImpl implements SaveButtonRepository {
  final DataSourcesSaveButtonRepository dataSources;

  const SaveButtonRepositoryImpl({required this.dataSources});

  @override
  Future<SaveButton> getInitSaveButton(Posts post) => dataSources.getInitSaveButton(post);

  @override
  Future<SaveButton> getSaveButton(Posts post,bool isSaved) => dataSources.getSaveButton(post, isSaved);

}
