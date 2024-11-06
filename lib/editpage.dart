import 'package:flutter/material.dart';
import 'package:googlekeep/function/function.dart';
import 'package:googlekeep/homepage.dart';
import 'package:googlekeep/model/model.dart';

class Editpage extends StatefulWidget {
  String? title;
  String? note;
  int index;
  Editpage(
      {super.key,
      required this.title,
      required this.note,
      required this.index});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    noteController = TextEditingController(text: widget.note);
  }

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
                          editBtn(context);
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

  void editBtn(BuildContext context) {
    final title = titleController.text.trim();
    final note = noteController.text.trim();
    if (title.isEmpty || note.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('title or note is empty')));
    } else {
      final editAll = googleKeep(title: title, note: note);
      editing(widget.index, editAll);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Homepage()));
    }
  }
}
