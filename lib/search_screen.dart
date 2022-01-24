import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> {
  final TextEditingController _searchTc = TextEditingController();

  Widget searchIcon() {
    return Icon(
      Icons.search,
      color: Colors.white60,
      size: 20.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: _searchTc,
            decoration: InputDecoration(
              prefixIcon: searchIcon(),
              hintText: '검색',
            ),
            onTap: () {},
          ),
          // ListView(),
        ],
      )),
    );
  }
}
