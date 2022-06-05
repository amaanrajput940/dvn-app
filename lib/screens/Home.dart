import 'package:dvnapp/SideDrawer.dart';
import 'package:dvnapp/http_service.dart';
import 'package:dvnapp/model/ModuleModel.dart';
import 'package:dvnapp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HttpService httpService = HttpService();

  final List<Map> myProducts = List.generate(
      100,
      (index) => {
            "id": index,
            "name": "Product $index",
            "color": "0xff788cb6"
          }).toList();

  // Future<List<ModuleModel>> modules = httpService.getPosts("/modules");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // modules = httpService.getPosts("/modules");
    // print(httpService.getPosts("/modules"));
    print("started");
  }

  @override
  Widget build(BuildContext context) {
    // Future<List<ModuleModel>> modules = httpService.getPosts("/modules");

    return Scaffold(
      drawer: const Drawer(
        child: SideDrawer(),
      ),
      appBar: AppBar(
        title: null,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: CustomColors.black),
      ),
      // body: Column(
      //   children: [
      //     const Text("Division App"),
      //     SizedBox(
      //       width: double.infinity,
      //       height: 300,
      //       child: FutureBuilder(
      //         future: httpService.getPosts("/modules"),
      //         builder: (BuildContext context,
      //             AsyncSnapshot<List<ModuleModel>> snapshot) {
      //           if (snapshot.hasData) {
      //             List<ModuleModel>? modules = snapshot.data;
      //             return ListView(
      //               children: modules!
      //                   .map(
      //                     (ModuleModel module) =>
      //                         ListTile(title: Text(module.title!)),
      //                   )
      //                   .toList(),
      //             );
      //           } else {
      //             return const Center(child: CircularProgressIndicator());
      //           }
      //         },
      //       ),
      //     )
      //   ],
      // ),
      body: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              color: Colors.transparent,
              height: 85,
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Division App",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const Text("Amaan Attari")
                      ]))),
          Expanded(
            child: Container(
                color: Colors.transparent,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FutureBuilder<List<ModuleModel>>(
                    future: httpService.getPosts("/modules"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 3,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15),
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, snapshot.data![index].appRoute!);
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    child: Card(
                                      elevation: 10,
                                      color: Color(int.parse(
                                          snapshot.data![index].hexColorCode!)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              IconData(
                                                  int.parse(snapshot
                                                      .data![index].appIcon!),
                                                  fontFamily: 'MaterialIcons'),
                                              size: 45,
                                              color: CustomColors.white,
                                            ),
                                            // Text(
                                            //   snapshot.data![index].title!,
                                            //   style: const TextStyle(
                                            //       color: CustomColors.white,
                                            //       fontSize: 20,
                                            //       fontWeight: FontWeight.bold),
                                            // ),
                                            Text(
                                              snapshot.data![index].title!,
                                              style: const TextStyle(
                                                  color: CustomColors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return const Text("Error");
                      } else {
                        return const Text("Loading....");
                      }
                    })),
          ),
        ],
      ),
    );
  }
}
