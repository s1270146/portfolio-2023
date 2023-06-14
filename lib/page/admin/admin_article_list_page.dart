import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_2023/page/admin/admin_article_create_page.dart';

class AdminArticleListPage extends StatelessWidget {
  const AdminArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        onChanged: (value) {},
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminArticleCreatePage(
                            collectionName: 'blog',
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
