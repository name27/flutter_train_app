import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainy_app/view/page/home_page.dart';
import 'package:trainy_app/view/widget/seat_tile.dart';
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
        builder: (context) =>
            SubmitAlert(selectedNum: selectedNum, selectedLabel: selectedLabel),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectedStation(stationName: widget.startStation),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                SelectedStation(stationName: widget.endStation),
              ],
            ),
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

class SubmitAlert extends StatelessWidget {
  const SubmitAlert({
    super.key,
    required this.selectedNum,
    required this.selectedLabel,
  });

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
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}

class LabelTextTile extends StatelessWidget {
  const LabelTextTile({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: text != null
          ? Center(
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            )
          : null,
    );
  }
}

class SeatText extends StatelessWidget {
  const SeatText({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Colors.purple : Colors.grey[300],
          ),
        ),
        SizedBox(width: 4),
        Text(
          isSelected ? "선택됨" : "선택안됨",
          style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
        ),
      ],
    );
  }
}

class SelectedStation extends StatelessWidget {
  const SelectedStation({super.key, required this.stationName});
  final String stationName;

  @override
  Widget build(BuildContext context) {
    return Text(
      stationName,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }
}
