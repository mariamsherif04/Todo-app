import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_task_page.dart';
import 'package:flutter_application_1/completed_task_page.dart';
import 'package:flutter_application_1/edit_task_page.dart';
import 'package:flutter_application_1/task.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  int selectedIndex = 0;

  List<Task> tasks = [
    Task(title: "Buy groceries", detail: "Milk, Eggs, Bread"),
    Task(title: "Study Flutter", detail: "Work on todo app"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFd6d7ef),
      appBar: AppBar(
        backgroundColor: const Color(0xFF380565),
        centerTitle: true,
        title: const Text(
          "TODO APP",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
      ),

     // Floating Add Button
          floatingActionButton: selectedIndex == 0
              ? SizedBox(
                  width: 70,
                  height: 70,
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xFF380565),
                    shape: const CircleBorder(),
                    onPressed: () async {
                      final newTask = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddTaskPage(), // no params now
                        ),
                      );

                      if (newTask != null && newTask is Task) {
                        setState(() {
                          tasks.add(newTask);
                        });
                      }
                    },
                    child: const Icon(Icons.add, size: 32, color: Colors.white),
                  ),
                )
              : null,

      // Bottom Navigation
    bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            backgroundColor: Colors.white,
            onTap: (index) {
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompletedTasksPage(tasks: tasks),
                  ),
                );
              } else {
                setState(() {
                  selectedIndex = index;
                });
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: "All",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline),
                label: "Completed",
              ),
            ],
            selectedItemColor: Color(0xFF9395D3),
          ),


      body: selectedIndex == 0
          ? _buildAllTasks()
          : CompletedTasksPage(tasks: tasks),
    );
  }

  Widget _buildAllTasks() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Center(
          child: Container(
            width: 400,
            height: 82,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title + Subtitle
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF9395D3),
                        )),
                    const SizedBox(height: 4),
                    Text(task.detail,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        )),
                  ],
                ),

                // Action buttons
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    // Edit
                    IconButton(
                          icon: const Icon(Icons.edit, color: Color(0xFFB3B7EE)),
                          onPressed: () async {
                            final updatedTask = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditTaskPage(
                                  initialTitle: task.title,
                                  initialDetail: task.detail,
                                  onSubmit: (String title, String detail) {
                                    Navigator.pop(context, Task(title: title, detail: detail));
                                  },
                                ),
                              ),
                            );

                            if (updatedTask != null && updatedTask is Task) {
                              setState(() {
                                final originalIndex = tasks.indexOf(task);
                                tasks[originalIndex] = updatedTask;
                              });
                            }
                          },
                        ),

                    // Delete
                    IconButton(
                      icon: const Icon(Icons.delete_outline,
                          color: Color(0xFFB3B7EE)),
                      onPressed: () {
                        setState(() {
                          tasks.remove(task);
                        });
                      },
                    ),

                    // Complete toggle
                    IconButton(
                      icon: Icon(
                        task.isCompleted
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        color: const Color(0xFFB3B7EE),
                      ),
                      onPressed: () {
                        setState(() {
                          task.isCompleted = !task.isCompleted;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
