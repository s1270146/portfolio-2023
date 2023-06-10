import 'package:flutter/material.dart';

class AdminArticleCreatePage extends StatelessWidget {
  const AdminArticleCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController overviewController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Article'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              width: 250,
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              width: 250,
              child: TextField(
                controller: overviewController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Overview',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
