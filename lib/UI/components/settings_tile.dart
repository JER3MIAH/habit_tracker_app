import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TilePosition { top, bottom, center }

class SettingTile extends StatelessWidget {
  final Text title;
  final void Function()? onTap;
  final TilePosition tilePosition;
  final bool isSelectedTile;
  final IconData? icon;
  final Color? fillColor;
  const SettingTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.tilePosition,
    this.fillColor,
    this.icon,
    this.isSelectedTile = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 21),
      ),
      contentPadding: const EdgeInsets.only(left: 12),
      shape: tilePosition == TilePosition.top
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)))
          : tilePosition == TilePosition.center
              ? const RoundedRectangleBorder()
              : const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
      title: title,
      trailing:
          isSelectedTile == true ? const Icon(FontAwesomeIcons.check) : null,
      tileColor: Theme.of(context).colorScheme.primary,
      onTap: onTap,
    );
  }
}
