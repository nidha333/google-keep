import 'package:flutter/material.dart';
import 'package:googlekeep/addpage.dart';
import 'package:googlekeep/editpage.dart';
import 'package:googlekeep/function/function.dart';
import 'package:googlekeep/model/model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String search = '';
  List<googleKeep> searchList = [];

  void searchUpdate() {
    searchList = googleNotifier.value
        .where((serchdata) =>
            serchdata.title!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    getAllDAta();
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Google Keep',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              profile(text: 'Notes', icon: const Icon(Icons.bubble_chart)),
              profile(
                  text: 'Remainder', icon: const Icon(Icons.notification_add)),
              profile(text: 'Create a new label', icon: const Icon(Icons.add)),
              profile(
                  text: 'Archive', icon: const Icon(Icons.archive_outlined)),
              profile(text: 'Trash', icon: const Icon(Icons.delete)),
              profile(text: 'Settings', icon: const Icon(Icons.settings)),
              profile(
                  text: 'Send App Feedback', icon: const Icon(Icons.message)),
              profile(
                  text: 'Help', icon: const Icon(Icons.help_center_outlined)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Addpage()));
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 230,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          search = value;
                          searchUpdate();
                        });
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search your notes',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                    ),
                  ),
                  const Icon(
                    Icons.view_agenda_outlined,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 20),
                  const CircleAvatar(
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: googleNotifier,
            builder: (context, value, child) {
              var displyNote = search.isNotEmpty ? searchList : value;
              if (displyNote.isEmpty) {
                return const Center(
                  child: Text('No Notes Available'),
                );
              }
              return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final datas = value[index];
                    return ListTile(
                      trailing: IconButton(
                          onPressed: () {
                            deletee(index);
                          },
                          icon: const Icon(Icons.delete)),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Editpage(
                                title: datas.title,
                                note: datas.note,
                                index: index)));
                      },
                      title: Text(datas.title!),
                      subtitle: Text(datas.note!),
                    );
                  });
            },
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 10,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.check_box_outlined, color: Colors.black),
                    Icon(Icons.brush_outlined, color: Colors.black),
                    Icon(Icons.mic_outlined, color: Colors.black),
                    Icon(Icons.image_outlined, color: Colors.black),
                    SizedBox(width: 100),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void deletee(int index) {
    deleteData(index);
  }
}

Widget profile({required String text, required icon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Text(text),
      leading: icon,
    ),
  );
}
