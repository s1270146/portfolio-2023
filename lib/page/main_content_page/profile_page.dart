import 'package:flutter/material.dart';
import 'package:portfolio_2023/component/profile_sentence.dart';
import 'package:portfolio_2023/component/profile_title.dart';
import 'package:portfolio_2023/component/skill_gauge.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String myName = '氏名: 森 航洋 (もり こうよう) Koyo MORI';
  final String universityName = '大学: 会津大学大学院';
  final String majorName = '研究科・専攻: コンピュータ理工学研究科 コンピュータ・情報システム学専攻';
  final String contents =
      'ポートフォリオをご覧いただきありがとうございます!\n大学院生の森と申します。\nアルバイトでアプリやWebの開発を行っています。\n研究では暗号をテーマに研究をしております。\n学部のときは、楕円曲線暗号を研究していました。\n現在は同種写像暗号に興味を持っています。\n\n趣味はサッカーです。自分のMacbook Airのスペックが低すぎて、Ubuntu 23.04に乗り換えました。。。';

  @override
  Widget build(BuildContext context) {
    final double childWidgetWidth = MediaQuery.of(context).size.width / 3;
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(0),
      // width: MediaQuery.of(context).size.width - 20,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: (MediaQuery.of(context).size.width - 50) / 2,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                  ProfileTitle(
                    title: 'Skill',
                    profileTitleWidth: childWidgetWidth,
                  ),
                  SkillGauge(
                    skillPoint: 95,
                    skillName: 'Flutter/Dart',
                    widgetWidth: childWidgetWidth,
                  ),
                  SkillGauge(
                    skillPoint: 75,
                    skillName: 'Python',
                    widgetWidth: childWidgetWidth,
                  ),
                  SkillGauge(
                    skillPoint: 60,
                    skillName: 'Go',
                    widgetWidth: childWidgetWidth,
                  ),
                  SkillGauge(
                    skillPoint: 50,
                    skillName: 'C/C++, Java',
                    widgetWidth: childWidgetWidth,
                  ),
                  SkillGauge(
                    skillPoint: 45,
                    skillName: 'Azure',
                    widgetWidth: childWidgetWidth,
                  ),
                  SkillGauge(
                    skillPoint: 20,
                    skillName: 'React',
                    widgetWidth: childWidgetWidth,
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
                  ProfileTitle(
                    title: 'Profile',
                    profileTitleWidth: childWidgetWidth,
                  ),
                  ProfileSentence(
                    sentence: myName,
                    profileSentenceWidth: childWidgetWidth,
                  ),
                  ProfileSentence(
                    sentence: universityName,
                    profileSentenceWidth: childWidgetWidth,
                  ),
                  ProfileSentence(
                    sentence: majorName,
                    profileSentenceWidth: childWidgetWidth,
                  ),
                  ProfileSentence(
                    sentence: contents,
                    profileSentenceWidth: childWidgetWidth,
                  ),
                  ProfileTitle(
                    title: 'Account',
                    profileTitleWidth: childWidgetWidth,
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
