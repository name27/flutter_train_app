import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainy_app/view/page/my_page.dart';

class SubmitAlert extends StatelessWidget {
  const SubmitAlert({
    super.key,
    required this.startStation,
    required this.endStation,
    required this.selectedNum,
    required this.selectedLabel,
  });
  final String startStation;
  final String endStation;
  final int? selectedNum;
  final String? selectedLabel;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        '예약 하시겠습니까?',
        style: TextStyle(
          color: CupertinoTheme.of(context).textTheme.textStyle.color,
        ),
      ),
      content: Text(
        '좌석: $selectedNum-$selectedLabel',
        style: TextStyle(
          color: CupertinoTheme.of(context).textTheme.textStyle.color,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: Text('취소'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text('확인'),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MyPage(
                  startStation: startStation,
                  endStation: endStation,
                  sheat: '$selectedNum-$selectedLabel',
                ),
              ),
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}
