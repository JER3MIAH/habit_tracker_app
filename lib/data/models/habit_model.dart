// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Habit {
  final String title;
  final String subtitle;
  bool isDone;

  Habit({
    this.title = '',
    this.subtitle = '',
    this.isDone = false,
  });

  Habit copyWith({
    String? title,
    String? subtitle,
    bool? isDone,
  }) {
    return Habit(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'isDone': isDone,
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) => Habit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Habit(title: $title, subtitle: $subtitle, isDone: $isDone)';

  @override
  bool operator ==(covariant Habit other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.subtitle == subtitle &&
      other.isDone == isDone;
  }

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode ^ isDone.hashCode;
}
