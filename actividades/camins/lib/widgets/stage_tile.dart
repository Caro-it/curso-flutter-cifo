import 'package:camins/styles/app_styles.dart';
import 'package:flutter/material.dart';

class StageTile extends StatelessWidget {
  const StageTile({
    super.key,
    required this.name,
    required this.number,
    required this.detail,
    required this.time,
  });

  final String name;
  final int number;
  final String detail;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: AppStyles.lightGreen,
        child: Text('$number', style: AppStyles.stageNumber),
      ),
      title: Text(name, style: AppStyles.stageName),
      subtitle: Text(detail, style: AppStyles.caption),
      trailing: Text(time, style: AppStyles.caption),
    );
  }
}
