import 'package:flutter/material.dart';
import 'package:habit_tracker_app/functions/dialogs_and_navigation.dart';

class HabitProvider extends ChangeNotifier {
  final List<String> items = ['1', '2', '3'];
  final TextEditingController textController = TextEditingController();

  List<Widget> customList() {
    return List.generate(
      items.length,
      (index) => ListTile(
        key: Key('$index'),
        title: Text('Item ${items[index]}'),
        trailing: const Icon(Icons.drag_handle_sharp),
      ),
    );
  }

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    notifyListeners();
  }

  void onPressed(BuildContext context) {
    // items.add(value);
    showDialog(
      context: context,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          yesOrNoAlertDialog(context),
          measureableAlertDialog(context),
        ],
      ),
    );
    notifyListeners();
  }
}
