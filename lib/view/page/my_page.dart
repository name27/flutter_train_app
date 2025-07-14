import 'package:flutter/material.dart';
import 'package:trainy_app/view/page/home_page.dart';
import 'package:trainy_app/view/widget/select_text.dart';
import 'package:trainy_app/view/widget/submit_button.dart';

class MyPage extends StatelessWidget {
  const MyPage({
    super.key,
    required this.startStation,
    required this.endStation,
    required this.sheat,
  });
  final String startStation;
  final String endStation;
  final String sheat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('마이 페이지')),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectText(text: '출발역', resultText: startStation),
            SelectText(text: '도착역', resultText: endStation),
            SelectText(
              text: '좌석',
              resultText: sheat,
              resultTextStyle: TextStyle(fontSize: 28),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
            );
          },
          child: SubmitButton(text: '홈으로 가기'),
        ),
      ),
    );
  }
}
