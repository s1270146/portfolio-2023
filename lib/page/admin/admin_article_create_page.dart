import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminArticleCreatePage extends StatefulWidget {
  const AdminArticleCreatePage({
    super.key,
    required this.collectionName,
  });
  final String collectionName;
  @override
  State<AdminArticleCreatePage> createState() => _AdminArticleCreatePageState();
}

class _AdminArticleCreatePageState extends State<AdminArticleCreatePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController overviewController = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();
  DateTime createDate = DateTime.now();
  DateTime? editDate;
  final format = DateFormat('yyyy年MM月dd日');
  @override
  Widget build(BuildContext context) {
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
            GestureDetector(
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                if (selectedDate != null) {
                  setState(() {
                    createDate = selectedDate;
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                width: 250,
                height: 60,
                child: Center(
                  child: Text(
                    format.format(createDate),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                if (selectedDate != null) {
                  setState(() {
                    editDate = selectedDate;
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                width: 250,
                height: 60,
                child: Center(
                  child: Text(
                    editDate != null ? format.format(editDate!) : '編集日',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
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
                controller: imagePathController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ImagePath',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              child: ElevatedButton(
                onPressed: () {
                  articleRegister(
                    titleController.text,
                    overviewController.text,
                    createDate,
                    editDate,
                    imagePathController.text,
                  );
                  Navigator.pop(context);
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void articleRegister(String title, String overview, DateTime createDate,
      DateTime? editDate, String imagePath) {
    FirebaseFirestore.instance.collection(widget.collectionName).add({
      'title': title,
      'overview': overview,
      'createDate': createDate,
      'editDate': editDate,
      'imagePath': imagePath,
    });
  }
}
