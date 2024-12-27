import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/task_provider.dart'; // Import TaskProvider

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Task Tracker')),
      ),
      body: Column(
        children: [
          const SizedBox(height: 35),
          Center(
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter your Task Here',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                taskProvider.addTask(_controller.text); // Add task to provider
                _controller.clear(); // Clear input after adding task
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 150, 242, 153),
            ),
            child: const Text(
              'Add Task',
              style: TextStyle(color: Colors.brown),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: task.isDone,
                              onChanged: (bool? value) {
                                taskProvider.toggleTaskStatus(index); // Toggle task status
                              },
                            ),
                            Text(
                              task.name,
                              style: TextStyle(
                                fontSize: 16,
                                decoration: task.isDone
                                    ? TextDecoration.lineThrough
                                    : null, // Strike-through if task is done
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            taskProvider.deleteTask(index); // Delete task
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
