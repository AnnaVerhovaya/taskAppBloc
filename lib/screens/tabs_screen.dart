import 'package:flutter/material.dart';
import '../widgets/index.dart';
import 'index.dart';



class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': PendingTaskScreen(), 'title': 'Текущие задачи'},
    {'pageName': CompletedTaskScreen(), 'title': 'CompletedTaskScreen'},
    {'pageName': FavoritedTaskScreen(), 'title': 'Избранное'}
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: ((context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen(),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text( _pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: (() => _addTask(context)),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: FloatingActionButton(
        onPressed: (() => _addTask(context)),
        tooltip: 'Создать задачу',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: ((index) {
          setState(() {
             _selectedPageIndex = index;
          });
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "Текущие"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: "Завершенные"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Избранное"),
        ],
      ),
    );
  }
}
