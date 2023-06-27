import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/profile/account_icon.dart';
import 'package:portfolio_2023/component/profile/profile_sentence.dart';
import 'package:portfolio_2023/component/profile/profile_title.dart';
import 'package:portfolio_2023/component/profile/skill_gauge.dart';
import 'package:portfolio_2023/component/variable_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  final String myName = '氏名: 森 航洋 (もり こうよう) Koyo MORI';
  final String universityName = '大学: 会津大学大学院';
  final String majorName = '研究科・専攻: コンピュータ理工学研究科 コンピュータ・情報システム学専攻';
  final String contents =
      'ポートフォリオをご覧いただきありがとうございます!\n大学院生の森と申します。\nアルバイトでアプリやWebの開発を行っています。\n研究では暗号をテーマに研究をしております。\n学部のときは、楕円曲線暗号を研究していました。\n現在は同種写像暗号に興味を持っています。\n\n趣味はサッカーです。自分のMacbook Airのスペックが低すぎて、Ubuntu 23.04を使ってみています。。';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double allWidth = MediaQuery.of(context).size.width;
    final double largeSize = ref.watch(largeSizeProvider);
    final double mediumSize = ref.watch(mediumSizeProvider);
    final double childWidgetWidth = allWidth > mediumSize
        ? MediaQuery.of(context).size.width / 3
        : MediaQuery.of(context).size.width / 6 * 5;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.all(0),
        child: allWidth > mediumSize
            ? Stack(
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
                          SizedBox(
                            width: childWidgetWidth,
                            child: Row(
                              children: [
                                AccountIcon(
                                  imagePath: 'images/facebook.png',
                                  radius: allWidth > largeSize ? 30 : 15,
                                  accountPath:
                                      'https://www.facebook.com/profile.php?id=100091787600298',
                                ),
                                AccountIcon(
                                  imagePath: 'images/linkedin.png',
                                  radius: allWidth > largeSize ? 28 : 14,
                                  accountPath:
                                      'https://www.linkedin.com/in/%E8%88%AA%E6%B4%8B-%E6%A3%AE-14b958237/',
                                ),
                                AccountIcon(
                                  imagePath: 'images/twitter.png',
                                  radius: allWidth > largeSize ? 35 : 17.5,
                                  accountPath:
                                      'https://twitter.com/PascalRoma27',
                                ),
                                AccountIcon(
                                  imagePath: 'images/github.png',
                                  radius: allWidth > largeSize ? 29 : 14.5,
                                  accountPath: 'https://github.com/s1270146',
                                ),
                                AccountIcon(
                                  imagePath: 'images/zenn.png',
                                  radius: allWidth > largeSize ? 32 : 16,
                                  accountPath: 'https://zenn.dev/pascal',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('images/profile.jpg'),
                    ),
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
                    SizedBox(
                      width: childWidgetWidth,
                      child: Row(
                        children: [
                          AccountIcon(
                            imagePath: 'images/facebook.png',
                            radius: allWidth > largeSize ? 30 : 15,
                            accountPath:
                                'https://www.facebook.com/profile.php?id=100091787600298',
                          ),
                          AccountIcon(
                            imagePath: 'images/linkedin.png',
                            radius: allWidth > largeSize ? 28 : 14,
                            accountPath:
                                'https://www.linkedin.com/in/%E8%88%AA%E6%B4%8B-%E6%A3%AE-14b958237/',
                          ),
                          AccountIcon(
                            imagePath: 'images/twitter.png',
                            radius: allWidth > largeSize ? 35 : 17.5,
                            accountPath: 'https://twitter.com/PascalRoma27',
                          ),
                          AccountIcon(
                            imagePath: 'images/github.png',
                            radius: allWidth > largeSize ? 29 : 14.5,
                            accountPath: 'https://github.com/s1270146',
                          ),
                          AccountIcon(
                            imagePath: 'images/zenn.png',
                            radius: allWidth > largeSize ? 32 : 16,
                            accountPath: 'https://zenn.dev/pascal',
                          ),
                        ],
                      ),
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
    );
  }
}
