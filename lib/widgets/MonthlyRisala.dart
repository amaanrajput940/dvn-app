import 'package:dvnapp/model/BooksModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppStateNotifier.dart';
import '../environment.dart';
import '../http_client.dart';

class MonthlyRisala extends StatefulWidget {
  MonthlyRisala({Key? key}) : super(key: key);

  @override
  State<MonthlyRisala> createState() => _MonthlyRisalaState();
}

class _MonthlyRisalaState extends State<MonthlyRisala> {
  // late Future<List> books;

  final monthlyBooks = "?age_of_data=30&limit=10";

  // AppHttpClient appHttpClient = AppHttpClient();

  @override
  Widget build(BuildContext context) {
    AppHttpClient appHttpClient = AppHttpClient();
    return ChangeNotifierProvider(
      create: (context) => AppStateNotifier(),
      child: FutureBuilder<List<BooksModel>>(
          future: appHttpClient.getBooks(context, monthlyBooks),
          builder: (context, snapshot) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(width: 1, color: Colors.black12),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width * 0.3333333,
                          // height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_alarm, size: 45),
                              Text("Title"),
                              Text("Subtitle"),
                              Text("Download Icons"),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Something went wrong!");
                  } else {
                    return Text("Loading...");
                  }
                  ;
                });
          }),
    );
  }
}
