import 'package:flutter/material.dart';
import 'package:trainy_app/util/station.dart';
import 'package:trainy_app/view/page/seat_page.dart';
import 'package:trainy_app/view/page/station_list_page.dart';
import 'package:trainy_app/view/widget/submit_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? startStation;
  String? endStation;
  List<String> _stationList = Station.nameList;

  void selectStation(bool isStartStation) async {
    //출발역이고 출발역리스트에 출발역이 들어있지 않으면
    if (isStartStation && !_stationList.contains(startStation)) {
      _stationList = List.from(Station.nameList);
      _stationList.remove(endStation);
      print(endStation);
    } else if (!isStartStation && !_stationList.contains(endStation)) {
      _stationList = List.from(Station.nameList);
      _stationList.remove(startStation);
    }
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(
          isStartStation: isStartStation,
          stationList: _stationList,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        if (Station.nameList.contains(result)) {
          _stationList.remove(result);
        }
        isStartStation ? startStation = result : endStation = result;
      });
    }
  }

  void clickSeatButton() {
    if (startStation != null && endStation != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SeatPage(startStation: startStation!, endStation: endStation!),
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('출발역과 도착역을 선택해주세요.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예메'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                //다크 모드일때는 어두운 회색, 라이트 모드일때는 흰색
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SelectText(
                    text: '출발역',
                    onTap: () => selectStation(true),
                    resultText: startStation,
                  ),
                  Container(width: 2, height: 50, color: Colors.grey[400]),
                  SelectText(
                    text: '도착역',
                    onTap: () => selectStation(false),
                    resultText: endStation,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: clickSeatButton,
              child: SubmitButton(text: '좌석 선택'),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectText extends StatelessWidget {
  const SelectText({
    super.key,
    required this.text,
    this.onTap,
    this.resultText,
  });
  final String text;
  final String? resultText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            resultText ?? '선택',
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ],
      ),
    );
  }
}
