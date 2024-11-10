// ignore_for_file: file_names

//We use this custom "about button" in the "ArtistsProfilePage"

import 'package:flutter/material.dart';

class AboutButton extends StatefulWidget {
  @override
  State<AboutButton> createState() => _AboutButtonState();

}

class _AboutButtonState extends State<AboutButton> {
  //At this stage with this button we implement only the idea of the text it would actually include.
  //The two following list contain the sample text.
  List<String> listViewTitle= [
    'Studio Name',
    'Contact info',
    'About Us'
  ];

  List<String> listViewSubtitle= [
    '#some name#',
    '"Business address/location"\n"Business phone number"\n"Business e-mail"',
    '#some text about the business#'
  ];

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog(
        context: context, 
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'About our studio',
                style: TextStyle(
                  fontSize: 24, 
                ),
              ),
              centerTitle: true,
            ),
            body: Material(
              color: Colors.black,
              type: MaterialType.card,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(height: 25.0, thickness: 0.9, color: Colors.white,), 
                itemCount: 3,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      listViewTitle[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    listViewSubtitle[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ), 
              )
            ),
          );
        }
      ),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF48e8b3),
        elevation: 5.0,
        fixedSize: Size(100.0, 35.0),
      ), 
      child: Text(
        'About',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        )
      ),
    );
  }
}