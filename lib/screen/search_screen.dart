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
      color: Colors.black,
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
          Container(
            padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _searchTc,
                    decoration: InputDecoration(
                      suffixIcon: searchIcon(),
                      hintText: '검색',
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
