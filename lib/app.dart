import 'package:flutter/material.dart';

const List<Map<String, String>> listData = [
  {
    'title': 'Page View',
    'page': '/slidePage',
  },
  {
    'title': 'Sheeps',
    'page': '/sheepsPage',
  },
  {
    'title': 'Profile',
    'page': '/profile'
  },
  {
    'title': 'Drop Down',
    'page': '/dropDown'
  }
];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice'),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: listData.length,
        itemBuilder: (context, index) => _buildListItem(context, listData[index]),
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, String> data) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, data['page']!),
      child: ListTile(
        title: Text(data['title']!),
      ),
    );
  }
}
