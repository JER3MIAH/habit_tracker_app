import 'package:flutter/material.dart';
import 'package:habit_tracker_app/functions/dialogs_and_navigation.dart';

import '../widgets/progress_painter.dart';

class HabitProvider extends ChangeNotifier {
  final List<String> items = ['1'];
  final double progress = 3;

  List<Widget> customList() {
    return List.generate(
        items.length,
        (index) => ListTile(
              key: Key('$index'),
              title: Text(items[index]),
              leading: CustomPaint(
                size: const Size(20, 20), // Size of the progress circle
                painter: ProgressPainter(progress: progress),
              ),
            ));
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

  void saveButtonOnpressed(BuildContext context, value) {
    Navigator.of(context).pop();
    items.add(value);
    notifyListeners();
  }
}
