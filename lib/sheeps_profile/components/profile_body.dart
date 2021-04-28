import 'package:flutter/material.dart';
import 'package:flutter_practice/sheeps_profile/components/build_info_card.dart';
import 'package:flutter_practice/sheeps_profile/profile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    Key? key,
    required this.profileList,
  }) : super(key: key);

  final List<Profile> profileList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          mainAxisExtent: 350,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return _buildProfileCard(context, index, profileList[index]);
          },
          childCount: profileList.length,
        ),
      ),
    );
  }

  Widget _buildProfileCard(context, int index, Profile profile) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/detail', arguments: profile),
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // 프로필 사진
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.accents[index % Colors.accents.length],
              ),
              height: 200,
            ),
            SizedBox(height: 8),
            Text( // 이름
              profile.name[0].toUpperCase() + profile.name.substring(1),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Row( // 정보 버튼
              children: List.generate(profile.info.length, (index) => buildInfoCard(profile.info[index])),
            ),
            SizedBox(height: 8),
            Text(profile.description), // 내용
          ],
        ),
      ),
    );
  }


}
