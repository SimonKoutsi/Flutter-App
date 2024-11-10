// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/presentation/cubit/SearchCubit/search_cubit.dart';
import 'package:clean_project/features/presentation/pages/ArtistProfilePage/ArtistProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageNavigate extends StatefulWidget {
  @override
  State<SearchPageNavigate> createState() => _SearchPageNavigateState();

}

class _SearchPageNavigateState extends State<SearchPageNavigate> {

  List<ArtistProfile> profileSearchList =[];
 
  
  void updateList (String value) async {
    await BlocProvider.of<SearchCubit>(context).getSearchList(value);
  }

  void initList () async {
    await BlocProvider.of<SearchCubit>(context).geInitList();
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
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Skuink',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          centerTitle: true,
       ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[
                Colors.black,
                Color(0xFF5f1da1),   
                Color(0xFF48e8b3),         
              ],
              stops: [
                0.3,
                0.6,
                1
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoaded) {
                profileSearchList= state.searchList;
                return _buildBody();
              } 
              else if (state is SearchWaiting){
                profileSearchList=state.initList;
                return _buildBody();
              }  
              else {
                initList();
                return CircularProgressIndicator();
              }    
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(        
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          TextField(
            onChanged: (value) => updateList(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'eg. flowers, anime',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey,),               
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(height: 1.0, thickness: 0.6,),
              itemCount: profileSearchList.length,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.all(8.0),
                title: Text(
                  profileSearchList[index].dummyProfileName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  profileSearchList[index].dummyGenre,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                leading: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: profileSearchList[index].dummyProfilePhoto, 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onTap:()async{ 
                  FocusScope.of(context).unfocus();
                  await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>ArtistsProfilePage(artistProfiledata: profileSearchList[index],))); 
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}