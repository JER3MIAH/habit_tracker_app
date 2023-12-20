import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/providers/habit_povider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HabitsLinearProgress extends ConsumerWidget {
  const HabitsLinearProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;

    final habits = ref.watch(habitProvider);
    final completedHabits = habits.where(
      (habit) => habit.isCompleted == true,
    );
    final percentage = (completedHabits.length / habits.length * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.0, right: 25, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    percentage == 0
                        ? 'Get Started'
                        : percentage == 100
                            ? 'You did it!'
                            : percentage < 100 && percentage > 79
                                ? 'Almost there!'
                                : percentage < 80 && percentage > 49
                                    ? 'More than halfway!'
                                    : 'Keep Going!',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                    )),
                Text(
                  '$percentage%',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 40,
            animation: true,
            lineHeight: 25.0,
            animationDuration: 500,
            percent: percentage / 100,
            barRadius: const Radius.circular(12),
            progressColor: theme.secondary,
            animateFromLastPercent: true,
            backgroundColor: theme.tertiary,
          ),
        ],
      ),
    );
  }
}
