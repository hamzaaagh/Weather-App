import 'package:flutter/material.dart';
import 'package:weatherapp/Pages/SearchPage.dart';

class Initialpage extends StatelessWidget {
  const Initialpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tap To Search For A City",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.blueAccent,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) {
                  return Searchpage();
                }));
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
    //Information Screen;
  }
}
