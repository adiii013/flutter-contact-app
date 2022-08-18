import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Row(
        children: [
          Icon(Icons.search),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search'
            ),
          )
        ],
      ),
    );
  }
}