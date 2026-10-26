import 'package:camins/styles/app_styles.dart';
import 'package:flutter/material.dart';

class StageTile extends StatelessWidget {
  const StageTile({
    super.key,
    required this.name,
    required this.number,
    required this.detail,
    required this.time,
    this.isFirst = false,
    this.isLast = false,
  });

  final String name;
  final int number;
  final String detail;
  final String time;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:68,
      child:Row(
        children: [
          SizedBox(
            width: 32,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: isFirst ? 34 : 0,
                  bottom: isLast ? 34 : 0,
                  left: 15,
                  width: 2,
                  child: ColoredBox(color: AppStyles.lightGreen),
                ),
                Center(
                  child: CircleAvatar(
                    radius:16,
                    backgroundColor: AppStyles.lightGreen,
                    child:Text('$number',style: AppStyles.stageNumber),
                    ),
                ),
              ],
            ),
          ),
          AppStyles.mediumSeparator,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppStyles.stageName),
                Text(detail, style: AppStyles.caption),
              ],
            ),
          ),
          Text(time, style: AppStyles.caption),
        ],
     ),     // Row
    );       // SizedBox (fin del return)
  }          // ← cierra el método build
}            // ← cierra la clase StageTile