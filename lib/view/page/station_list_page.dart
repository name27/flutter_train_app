import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({
    super.key,
    required this.isStartStation,
    required this.stationList,
  });
  final bool isStartStation;
  final List<String> stationList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isStartStation ? '출발역' : '도착역'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      body: ListView.builder(
        itemCount: stationList.length,
        itemBuilder: (context, index) =>
            StationTile(stationName: stationList[index]),
      ),
    );
  }
}

class StationTile extends StatelessWidget {
  const StationTile({super.key, required this.stationName});
  final String stationName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, stationName);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            Text(
              stationName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
