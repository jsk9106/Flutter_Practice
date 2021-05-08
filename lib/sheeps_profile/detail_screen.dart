import 'package:flutter/material.dart';
import 'package:flutter_practice/sheeps_profile/components/build_info_card.dart';
import 'package:flutter_practice/sheeps_profile/components/detail_header_card.dart';
import 'package:flutter_practice/sheeps_profile/profile.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final Profile profile =
        ModalRoute.of(context)!.settings.arguments as Profile;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailHeaderCard(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleAndButton(profile), // 사진
                  SizedBox(height: 10),
                  Row( // 인포 버튼
                    children: List.generate(profile.info.length,
                        (index) => buildInfoCard(profile.info[index])),
                  ),
                  SizedBox(height: 20),
                  Text(profile.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildTitleAndButton(Profile profile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            profile.name[0].toUpperCase() + profile.name.substring(1),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(Icons.share),
                color: Colors.grey,
                splashRadius: 30,
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.grey,
                splashRadius: 30,
                onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
