import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_2023/component/admin_provider/admin_variable.dart';
import 'package:portfolio_2023/model/article.dart';

class AdminArticleEditPage extends ConsumerStatefulWidget {
  const AdminArticleEditPage({
    super.key,
    required this.article,
  });
  final Article article;
  @override
  ConsumerState<AdminArticleEditPage> createState() =>
      _AdminArticleEditPageState();
}

class _AdminArticleEditPageState extends ConsumerState<AdminArticleEditPage> {
  final format = DateFormat('yyyy年MM月dd日');
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final editArticle = ref.watch(editArticleProvider(widget.article));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Article'),
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
              child: Text('ID : ${widget.article.id}'),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              width: 250,
              child: TextFormField(
                initialValue: editArticle.title,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
                onChanged: (value) =>
                    ref.read(editArticleProvider(editArticle).notifier).update(
                          (state) => state.copyWith(
                            title: value,
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
              child: TextFormField(
                initialValue: editArticle.overview,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                onChanged: (value) =>
                    ref.read(editArticleProvider(editArticle).notifier).update(
                          (state) => state.copyWith(
                            overview: value,
                          ),
                        ),
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
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                if (selectedDate != null) {
                  ref.read(editArticleProvider(editArticle).notifier).update(
                        (state) => state.copyWith(createDate: selectedDate),
                      );
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
                    format.format(editArticle.createDate),
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
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                if (selectedDate != null) {
                  ref.watch(editArticleProvider(editArticle).notifier).update(
                        (state) => state.copyWith(editDate: selectedDate),
                      );
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
                    editArticle.editDate != null
                        ? format.format(editArticle.editDate!)
                        : '編集日',
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
              child: TextFormField(
                initialValue: editArticle.imagePath,
                onChanged: (value) =>
                    ref.watch(editArticleProvider(editArticle).notifier).update(
                          (state) => state.copyWith(
                            imagePath: value,
                          ),
                        ),
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
                  Navigator.pop(context);
                },
                child: const Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
