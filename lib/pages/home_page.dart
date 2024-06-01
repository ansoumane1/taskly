import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";

import "../models/task.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;
  Box? _box;
  String? _newTaskTitle;
  @override
  void initState() {
    // TODO: implement initState
      super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    print("$_newTaskTitle");
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: _deviceHeight * 0.15,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text("Taskly!", style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),)
      ),
      floatingActionButton: _addTaskButton(),
      body: _taskView(),
    );
  }

  Widget _taskView() {

    return FutureBuilder(future: Hive.openBox('tasks'), builder:(BuildContext _context , AsyncSnapshot _snapshot){
       if(_snapshot.hasData){
         _box = _snapshot.data;
         return _taskList();
       }else{
         return const Center(child: CircularProgressIndicator(
           color: Colors.blue,
         ),);
       }
    });
  }

  Widget _taskList(){
    //Task _newTask = Task(content: "Go to play", timestamp: DateTime.now(), completed: false);
    //_box?.add(_newTask.toMap());

    List tasks = _box!.values.toList();
    print(tasks);
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext _context, int _index) {
        var task = Task.fromJson(tasks[_index]);
        return  ListTile(
          title:  Text(task.content, style: TextStyle(decoration: task.completed ?  TextDecoration.lineThrough:null),),
          subtitle: Text(task.timestamp.toString()),

          trailing: Icon(
            task.completed ? Icons.check_box_outlined: Icons.check_box_outline_blank,
            color:  Colors.blue,
          ),
          onTap: (){
            task.completed = !task.completed;
            _box!.putAt(_index, task.toMap());
            setState(() {

            });
          },
          onLongPress: (){
            _box!.deleteAt(_index);
            setState(() {

            });
          },
        );
      },

    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
        onPressed: _displayTaskPopUp,
        child: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.blue,
    );
  }

  void _displayTaskPopUp() {
    showDialog(context: context, builder: (BuildContext context)  {
      return  AlertDialog(
        title: Text("add New Task"),
        content: TextField(
          onChanged: (_values) {

            setState(() {
              _newTaskTitle = _values;
            });

          },
          onSubmitted:(_) {
            if(_newTaskTitle != null){
              var _task = Task(content: _newTaskTitle!, timestamp: DateTime.now(), completed: false);
              _box!.add(_task.toMap());

              setState(() {
                _newTaskTitle = null;
                Navigator.pop(context);
              });
            }
          },
          decoration: InputDecoration(hintText: "Task Name"),
        ),
      );
    });
  }
}
