import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/model/article.dart';

final largeSizeProvider = StateProvider<double>((ref) => 1020.0);
final mediumSizeProvider = StateProvider<double>((ref) => 750.0);

final blogArticleListProvider = StreamProvider.autoDispose((ref) {
  final firestore = FirebaseFirestore.instance.collection('blog').snapshots();
  return firestore.map((event) {
    List<Article> articleList = [];
    for (var doc in event.docs) {
      articleList.add(Article.fromJson(doc.id, doc.data()));
    }
    return articleList;
  });
});

final worksArticleListProvider = StreamProvider.autoDispose((ref) {
  final firestore = FirebaseFirestore.instance.collection('works').snapshots();
  return firestore.map((event) {
    List<Article> articleList = [];
    for (var doc in event.docs) {
      articleList.add(Article.fromJson(doc.id, doc.data()));
    }
    return articleList;
  });
});

final researchArticleListProvider = StreamProvider.autoDispose((ref) {
  final firestore =
      FirebaseFirestore.instance.collection('research').snapshots();
  return firestore.map((event) {
    List<Article> articleList = [];
    for (var doc in event.docs) {
      articleList.add(Article.fromJson(doc.id, doc.data()));
    }
    return articleList;
  });
});
