// ignore_for_file: file_names

import 'package:clean_project/features/presentation/pages/SearchPage/SearchPageNavigate/SearchPageNavigate.dart';
import 'package:flutter/material.dart';



class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //With GestureDetector we dismiss the keyboard every time we click outside of it.
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
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
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(        
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120.0,
                ),
                Text(
                  'Search for Artists, genre etc', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.search_outlined,
                    color: Colors.grey,
                  ),
                  label: Text('    eg. Artists name, genre',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                    ),
                  ),
                  onPressed: (){ Navigator.of(context).push(MaterialPageRoute(
                             builder: (context)=> SearchPageNavigate())); 
                  },
                  style: OutlinedButton.styleFrom(
                    alignment: AlignmentDirectional.centerStart,
                    padding: EdgeInsets.all(12),
                    backgroundColor: Colors.white,
                    fixedSize: Size(double.maxFinite, 58),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
