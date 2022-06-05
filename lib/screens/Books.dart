import 'package:dvnapp/SideDrawer.dart';
import 'package:dvnapp/screens/WeeklyRisala.dart';
import 'package:dvnapp/widgets/MonthlyRisala.dart';
import 'package:dvnapp/theme/colors.dart';
import 'package:dvnapp/widgets/Skeleton.dart';
import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  // late double width = MediaQuery.of(context).size.width;
  // late double height = MediaQuery.of(context).size.height;
  // late int gridCrossAxisCount;
  //   if (width > 1600) {
  //     gridCrossAxisCount = 4;
  //   } else if (width > 1300) {
  //     gridCrossAxisCount = 3;
  //   } else if (width > 800) {
  //     gridCrossAxisCount = 2;
  //   } else {
  //     gridCrossAxisCount = 1;
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SideDrawer(),
      ),
      appBar: AppBar(
        title: const Text("Books"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 270,
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 10, top: 20),
                  child: Text(
                    "Book Of The Week",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                WeeklyRisala()
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[100],
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 10, top: 20),
                      child: Text(
                        "Books Of The Month",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: MonthlyRisala()),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [Text("Label 3")],
            ),
          )
        ],
      ),
    );
  }
}
