import 'package:flutter/material.dart';
import 'package:portfolio_2023/component/skill_gauge.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String myName = '氏名: 森 航洋 (もり こうよう) Koyo MORI';
  final String universityName = '大学: 会津大学大学院';
  final String majorName = '研究科・専攻: コンピュータ理工学研究科 コンピュータ・情報システム学専攻';
  final String contents =
      'ポートフォリオをご覧いただきありがとうございます!\n大学院生の森と申します。\nアルバイトでアプリやWebの開発を行っています。\n研究では暗号をテーマに研究をしております。\n学部のときは、楕円曲線暗号を研究していました。\n現在は同種写像暗号に興味を持っています。\n\n趣味はサッカーです!';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width - 20,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: (MediaQuery.of(context).size.width - 50) / 2,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 160,
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: (MediaQuery.of(context).size.width - 50) / 2,
              child: Column(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Text(myName),
                  Text(universityName),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(majorName)),
                  Text(contents),
                  Text(
                    'Skill',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  SkillGauge(
                    skillPoint: 95,
                    skillName: 'Flutter',
                    halfWidth: (MediaQuery.of(context).size.width - 50) / 2,
                  ),
                  SkillGauge(
                    skillPoint: 60,
                    skillName: 'Go',
                    halfWidth: (MediaQuery.of(context).size.width - 50) / 2,
                  ),
                  SkillGauge(
                    skillPoint: 20,
                    skillName: 'React',
                    halfWidth: (MediaQuery.of(context).size.width - 50) / 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
