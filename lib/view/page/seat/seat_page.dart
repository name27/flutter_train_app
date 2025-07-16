import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainy_app/view/page/my_page.dart';
import 'package:trainy_app/view/page/seat/widget/label_text_tile.dart';
import 'package:trainy_app/view/page/seat/widget/seat_text.dart';
import 'package:trainy_app/view/page/seat/widget/selected_station.dart';
import 'package:trainy_app/view/page/seat/widget/submit_alert.dart';
import 'package:trainy_app/view/page/seat/widget/seat_tile.dart';
import 'package:trainy_app/view/widget/submit_button.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({
    super.key,
    required this.startStation,
    required this.endStation,
  });
  final String startStation;
  final String endStation;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? selectedLabel;
  int? selectedNum;
  Map<String, dynamic> labelSeatMap = {};

  selectSeat(String label, int seat) {
    setState(() {
      selectedLabel = label;
      selectedNum = seat;
      labelSeatMap["label"] = label;
      labelSeatMap["seat"] = seat;
    });
  }

  bool isSelected(String label, int seat) {
    return labelSeatMap['label'] == label && labelSeatMap['seat'] == seat;
  }

  void clickSubmitButton() {
    if (selectedLabel != null || selectedNum != null) {
      showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => SubmitAlert(
          startStation: widget.startStation,
          endStation: widget.endStation,
          selectedNum: selectedNum,
          selectedLabel: selectedLabel,
        ),
      );
      return;
    } else {
      showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('좌석을 선택해주세요.'),
          actions: [
            CupertinoDialogAction(
              child: Text('확인'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: SelectedStation(
                          stationName: widget.startStation,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 30,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    Expanded(
                      child: Center(
                        child: SelectedStation(stationName: widget.endStation),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SeatText(isSelected: true),
                SizedBox(width: 20),
                SeatText(isSelected: false),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      seatTileList('A'),
                      SizedBox(width: 4),
                      seatTileList('B'),
                      SizedBox(width: 4),
                      seatTileList(null),
                      SizedBox(width: 4),
                      seatTileList('C'),
                      SizedBox(width: 4),
                      seatTileList('D'),
                      SizedBox(width: 4),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: clickSubmitButton,
          child: SubmitButton(text: '예약 하기'),
        ),
      ),
    );
  }

  Column seatTileList(String? label) {
    return Column(
      children: [
        LabelTextTile(text: label),
        for (var i = 0; i < 20; i++)
          Column(
            children: [
              label != null
                  ? GestureDetector(
                      onTap: () => selectSeat(label, i + 1),
                      child: SeatTile(isSelected: isSelected(label, i + 1)),
                    )
                  : LabelTextTile(text: (i + 1).toString()),

              SizedBox(height: 8),
            ],
          ),
      ],
    );
  }
}
