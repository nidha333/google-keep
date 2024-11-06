import 'package:flutter/material.dart';
import 'package:googlekeep/function/function.dart';
import 'package:googlekeep/model/model.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.pin_drop)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_alert_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.save_alt_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(fontSize: 23)),
                ),
                TextField(
                  controller: noteController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Note',
                      hintStyle: TextStyle(fontSize: 17)),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_box_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.palette_outlined)),
                    const SizedBox(
                      width: 35,
                    ),
                    const Text('edited Now'),
                    const SizedBox(
                      width: 36,
                    ),
                    IconButton(
                        onPressed: () {
                          submitBtn();
                        },
                        icon: const Icon(Icons.check)),
                    IconButton(
                        onPressed: () {},
                        icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert)))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void submitBtn() {
    final title = titleController.text;
    final note = noteController.text;
    if (title.isNotEmpty && note.isNotEmpty) {
      final totaladd = googleKeep(title: title, note: note);
      addData(totaladd);

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('enter any notes')));
    }
  }
}
