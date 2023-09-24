import 'package:flutter/material.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:riverpod_todo/common/widgets/titles.dart';

class XpansionTile extends StatelessWidget {
  const XpansionTile(
      {super.key,
      required this.text,
      required this.text2,
      required this.children,
      this.onExpansionChanged,
      this.trailing});

  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final List<Widget> children;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppConst.kBKLight,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: BottomTitles(text: text, text2: text2),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.trailing,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
}
