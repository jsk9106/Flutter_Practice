import 'package:flutter/material.dart';
import 'package:flutter_practice/sheeps_community/provider/community_provider.dart';
import 'package:provider/provider.dart';

class SheepsCommunityScreen extends StatefulWidget {
  @override
  _SheepsCommunityScreenState createState() => _SheepsCommunityScreenState();
}

class _SheepsCommunityScreenState extends State<SheepsCommunityScreen> {
  @override
  Widget build(BuildContext context) {
    CommunityProvider _communityProvider =
        Provider.of<CommunityProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          _buildCustomSearchBar(),
          _buildPageController(_communityProvider),
          SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              itemCount: 2,
              onPageChanged: (value) {
                _communityProvider.changePage(value);
              },
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  color: Colors.accents[index],
                  child: Center(
                    child: Text((index + 1).toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row _buildPageController(CommunityProvider _communityProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPageControllerWidget(
          _communityProvider,
          '개인',
          () => _communityProvider.changePage(0),
          0,
        ),
        buildPageControllerWidget(
          _communityProvider,
          '직군',
          () => _communityProvider.changePage(1),
          1,
        ),
      ],
    );
  }

  Widget buildPageControllerWidget(CommunityProvider communityProvider,
      String text, GestureTapCallback press, int pageInt) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: pageInt == communityProvider.currentPage
              ? Border(bottom: BorderSide(color: Colors.green))
              : Border(bottom: BorderSide(color: Colors.transparent)),
        ),
        child: Text(text),
      ),
    );
  }

  Container _buildCustomSearchBar() {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.grey[200],
      child: Center(child: Text('SearchBar')),
    );
  }
}
