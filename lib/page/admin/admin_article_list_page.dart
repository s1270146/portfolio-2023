import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/admin_provider/admin_variable.dart';
import 'package:portfolio_2023/page/admin/admin_article_create_page.dart';

class AdminArticleListPage extends ConsumerWidget {
  const AdminArticleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(categoryProvider);
    final articleList = ref.watch(articleListProvider);
    currentAdminUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              child: SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child: DropdownButton(
                        isExpanded: true,
                        value: category,
                        items: const <DropdownMenuItem>[
                          DropdownMenuItem(
                            value: 'blog',
                            child: Text('Blog'),
                          ),
                          DropdownMenuItem(
                            value: 'works',
                            child: Text('Works'),
                          ),
                          DropdownMenuItem(
                            value: 'research',
                            child: Text('Research'),
                          ),
                        ],
                        onChanged: (value) {
                          ref.read(categoryProvider.notifier).update(
                                (state) => value.toString(),
                              );
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminArticleCreatePage(
                            collectionName: category,
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            articleList.when(
              data: (list) {
                List<Container> containerList = [];
                for (var article in list) {
                  containerList.add(
                    Container(
                      margin: const EdgeInsets.all(5),
                      width: 250,
                      height: 80,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(article.title),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Column(
                  children: containerList,
                );
              },
              error: (error, stackTrace) {
                return Text(
                  error.toString(),
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  void currentAdminUser() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          print(user.uid);
        } else {
          print('signout');
        }
      },
    );
  }
}
