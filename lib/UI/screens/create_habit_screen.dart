import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class CreateHabitScreen extends HookConsumerWidget {
  const CreateHabitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: [
            const CreateHabitHeader(),
            const CustomLabelText(
              labelText: 'Title',
            ),
            CustomTextField(
              controller: titleController,
              keyboardType: TextInputType.name,
              maxLength: 30,
              hintText: 'Enter habit title',
            ),
            const CustomLabelText(
              labelText: 'Description',
            ),
            CustomTextField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              hintText: 'Optional',
            ),
            const SizedBox(height: 20),
            SaveButton(
              onTap: () {
                ref.watch(habitProvider.notifier).addHabit(
                      Habit(
                        id: const Uuid().v4(),
                        title: titleController.text,
                        description: descriptionController.text,
                        createdAt: DateTime.now(),
                        isCompleted: false,
                      ),
                    );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
