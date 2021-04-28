import 'package:flutter/material.dart';
import 'package:flutter_practice/sheeps_profile/components/profile_body.dart';
import 'package:flutter_practice/sheeps_profile/components/profile_searchbar.dart';
import 'package:flutter_practice/sheeps_profile/profile.dart';

class SheepsProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: 70,
              elevation: 0,
              floating: true,
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: ProfileSearchBar(),
            ),
            SliverPadding(padding: const EdgeInsets.only(top: 20)),
            ProfileBody(profileList: profileList),
          ],
        ),
      ),
    );
  }
}


