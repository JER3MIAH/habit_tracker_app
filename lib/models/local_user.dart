// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:hive/hive.dart';

import 'enums/gender.dart';

part 'local_user.g.dart';

@HiveType(typeId: 2)
class LocalUser {
  @HiveField(0)
  String name;

  @HiveField(1)
  Gender gender;

  @HiveField(2)
  Uint8List? avatarPath;

  LocalUser({
    this.name = '',
    required this.gender,
    this.avatarPath,
  });

  LocalUser copyWith({
    String? name,
    Gender? gender,
    Uint8List? avatarPath,
  }) {
    return LocalUser(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}
