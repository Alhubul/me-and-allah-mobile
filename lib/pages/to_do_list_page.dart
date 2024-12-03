import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import font_awesome_flutter

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<String> tasks = ['Sholat Subuh', 'Sholat Dhuhur', 'Sholat Ashar', 'Sholat Maghrib', 'Sholat Isya'];
  List<bool> completed = [false, false, false, false, false];

  // Fungsi untuk toggle status penyelesaian task
  void toggleCompletion(int index) {
    setState(() {
      completed[index] = !completed[index];
    });
  }

  // Fungsi untuk menambahkan task baru
  void addTask(String task) {
    setState(() {
      tasks.add(task);
      completed.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List Sholat'),
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft), // Gunakan ikon dari FontAwesomeIcons
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), 
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tasks[index], style: TextStyle(color: Colors.black)),
                      leading: Checkbox(
                        value: completed[index],
                        onChanged: (bool? value) {
                          toggleCompletion(index);
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(FontAwesomeIcons.trashAlt, color: Colors.green), // Gunakan ikon dari FontAwesomeIcons
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                            completed.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    String newTask = '';
                    return AlertDialog(
                      title: Text('Tambah Sholat Sunnah'),
                      content: TextField(
                        onChanged: (value) {
                          newTask = value;
                        },
                        decoration: InputDecoration(hintText: 'Masukkan nama sholat sunnah'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            if (newTask.isNotEmpty) {
                              addTask(newTask);
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Tambahkan'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Batal'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(FontAwesomeIcons.plus), // Gunakan ikon dari FontAwesomeIcons
              backgroundColor: Colors.green[700],
            ),
          ],
        ),
      ),
    );
  }
}
