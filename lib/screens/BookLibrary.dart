import 'package:flutter/material.dart';

class BookLibrary extends StatefulWidget {
  BookLibrary({Key? key}) : super(key: key);

  @override
  State<BookLibrary> createState() => _BookLibraryState();
}

class _BookLibraryState extends State<BookLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Books"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.lime,
                  child: Column(
                    children: [Text("Weekly Risala")],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.teal,
                  child: Column(
                    children: [
                      Text("Weekly Risala"),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: GridView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 50,
                                    childAspectRatio: 1 / 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            children: [
                              Container(
                                  color: Colors.amber,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '1',
                                    style: TextStyle(fontSize: 30),
                                  )),
                              Container(
                                  color: Colors.amber,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '1',
                                    style: TextStyle(fontSize: 30),
                                  )),
                              Container(
                                  color: Colors.amber,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '1',
                                    style: TextStyle(fontSize: 30),
                                  ))
                            ]),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.cyan,
                  child: Text(' flex 5'),
                ))
          ],
        ));
  }
}
