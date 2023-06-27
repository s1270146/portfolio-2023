import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_2023/model/article.dart';

class AdminArticleEditPage extends StatefulWidget {
  const AdminArticleEditPage({
    super.key,
    required this.article,
    required this.collectionName,
  });
  final Article article;
  final String collectionName;
  @override
  State<AdminArticleEditPage> createState() => _AdminArticleEditPageState();
}

class _AdminArticleEditPageState extends State<AdminArticleEditPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController overviewController = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();
  final TextEditingController contentsController = TextEditingController();
  late DateTime createDate;
  DateTime? editDate;
  final format = DateFormat('yyyy年MM月dd日');

  @override
  void initState() {
    super.initState();
    setState(() {
      titleController.text = widget.article.title;
      overviewController.text = widget.article.overview!;
      imagePathController.text = widget.article.imagePath;
      contentsController.text = widget.article.contents;
      createDate = widget.article.createDate;
      editDate = widget.article.editDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Article'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                width: 250,
                child: Text('ID : ${widget.article.id}'),
              ),
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
                  final selectedDate = await selectDate();
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
                  final selectedDate = await selectDate();
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
                width: 250,
                child: TextField(
                  controller: contentsController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contents',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection(widget.collectionName)
                            .doc(widget.article.id)
                            .delete();
                        Navigator.pop(context);
                      },
                      child: const Text('Delete'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.article
                            .copyWith(
                              title: titleController.text,
                              overview: overviewController.text,
                              imagePath: imagePathController.text,
                              createDate: createDate,
                              editDate: editDate,
                              contents: contentsController.text,
                            )
                            .toFirestore(collectionName: widget.collectionName);
                        Navigator.pop(context);
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> selectDate() async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );
  }
}
