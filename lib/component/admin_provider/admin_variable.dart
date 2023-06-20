import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/model/article.dart';

final categoryProvider = StateProvider<String>((ref) => 'blog');

final articleListProvider = StreamProvider((ref) {
  final category = ref.watch(categoryProvider);
  final firestore = FirebaseFirestore.instance.collection(category).snapshots();
  return firestore.map((event) {
    List<Article> articleList = [];
    for (var doc in event.docs) {
      articleList.add(Article.fromJson(doc.id, doc.data()));
    }
    return articleList;
  });
});
