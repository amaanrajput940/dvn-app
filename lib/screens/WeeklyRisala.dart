import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dvnapp/AppStateNotifier.dart';
import 'package:dvnapp/http_client.dart';
import 'package:dvnapp/model/BooksModel.dart';
import 'package:dvnapp/theme/colors.dart';
// import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/Skeleton.dart';
// import 'package:permission_handler/permission_handler.dart';

class WeeklyRisala extends StatefulWidget {
  const WeeklyRisala({Key? key}) : super(key: key);

  @override
  State<WeeklyRisala> createState() => _WeeklyRisalaState();
}

class _WeeklyRisalaState extends State<WeeklyRisala> {
  final String weeklyRisala = "?age_of_data=8&limit=1";

  // late Future<List> books;

  final fileUrl =
      "http://amaanattari.ddns.net:8000/media-api/public/books/jannat-kay-baray-mein-sawal-jawab.pdf";
  var imageUrl =
      "https://www.itl.cat/pngfile/big/10-100326_desktop-wallpaper-hd-full-screen-free-download-full.jpg";
  bool downloading = false;
  String downloadingStr = "";
  String savePath = "";
  double download = 0;

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory dir = await getApplicationDocumentsDirectory();

    path = '${dir.path}/$uniqueFileName';

//     Directory(dir.path + '/' + 'dir').create(recursive: true)
// // The created directory is returned as a Future.
//         .then((Directory directory) {
//       print('Path of New Dir: ' + directory.path);
//     });
    return path;
  }

  Future downloadFile(String fileUrl) async {
    try {
      Dio dio = Dio();

      String fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);

      savePath = await getFilePath(fileName);
      await dio.download(fileUrl, savePath, onReceiveProgress: (rec, total) {
        setState(() {
          downloading = true;
          download = (rec / total) * 100;
          downloadingStr = "Downloading Image : $download";
        });
      });
      setState(() {
        downloading = false;
        downloadingStr = "Completed";
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // getWeeklyRisala();
  }

  @override
  Widget build(BuildContext context) {
    // dynamic weeklyRisala = Provider.of<AppStateNotifier>(context).weekly_risala;
    print("printing");
    // print(weeklyRisala);

    AppHttpClient appHttpClient = AppHttpClient();
    // List<BooksModel> books = BooksModel.fromJson(weeklyRisala);
    return ChangeNotifierProvider(
      create: (context) => AppStateNotifier(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.250,
        child: FutureBuilder<List<BooksModel>>(
            future: appHttpClient.getBooks(context, weeklyRisala),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final filePath = snapshot.data![index].path!;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: MediaQuery.of(context).size.height * 0.250,
                            child: Card(
                                clipBehavior: Clip.hardEdge,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                elevation: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'http://amaanattari.ddns.net:8000/media-api/public/books/${filePath}.jpg'))),
                                )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.60,
                            height: MediaQuery.of(context).size.height * 0.250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, bottom: 10, top: 5, right: 8.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.99,
                                    child: Text(
                                      snapshot.data![index].title!,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Text("Pages: 19"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Document: pdf"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(downloadingStr),
                                OutlinedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(horizontal: 28)),
                                    foregroundColor: MaterialStateProperty.all(
                                        CustomColors.primaryColor),
                                    side: MaterialStateProperty.all(BorderSide(
                                        width: 1.8,
                                        color: CustomColors.primaryColor)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                  child: const Text("Download"),
                                )
                                // ElevatedButton(
                                //   style: ButtonStyle(
                                //       backgroundColor:
                                //           MaterialStateProperty.all(
                                //               CustomColors.primaryColor)),
                                //   onPressed: () {
                                //     downloadFile(
                                //         "http://amaanattari.ddns.net:8000/media-api/public/books/${filePath}.jpg");
                                //     // Map<Permission, PermissionStatus> statuses = await [
                                //     //   Permission.storage,
                                //     //   //add more permission to request here.
                                //     // ].request();

                                //     // if (statuses[Permission.storage]!.isGranted) {
                                //     //   var dir = await DownloadsPathProvider.downloadsDirectory;
                                //     //   if (dir != null) {
                                //     //     String savename = "file.pdf";
                                //     //     String savePath = dir.path + "/$savename";
                                //     //     print(savePath);
                                //     //     //output:  /storage/emulated/0/Download/banner.png

                                //     //     try {
                                //     //       await Dio().download(fileUrl, savePath,
                                //     //           onReceiveProgress: (received, total) {
                                //     //         if (total != -1) {
                                //     //           print((received / total * 100).toStringAsFixed(0) +
                                //     //               "%");
                                //     //           //you can build progressbar feature too
                                //     //         }
                                //     //       });
                                //     //       print("File is saved to download folder.");
                                //     //     } on DioError catch (e) {
                                //     //       print(e.message);
                                //     //     }
                                //     //   }
                                //     // } else {
                                //     //   print("No permission to read and write.");
                                //     // }
                                //   },
                                //   child: Text("Download File."),
                                // )
                              ],
                            ),
                          )
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("OUt of reach");
              } else {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Skeleton(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 170,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(
                          height: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Skeleton(),
                        SizedBox(
                          height: 10,
                        ),
                        Skeleton(),
                        SizedBox(
                          height: 10,
                        ),
                        Skeleton(),
                      ],
                    )),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}




// Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.only(left: 10),
//                             width: MediaQuery.of(context).size.width * 0.40,
//                             height: MediaQuery.of(context).size.height * 0.250,
//                             child: Card(
//                                 clipBehavior: Clip.hardEdge,
//                                 color: Colors.transparent,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(4)),
//                                 elevation: 0,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(4),
//                                       image: new DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: NetworkImage(
//                                               'http://amaanattari.ddns.net:8000/media-api/public/books/jannat-kay-baray-mein-sawal-jawab.jpg'))),
//                                 )),
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.60,
//                             height: MediaQuery.of(context).size.height * 0.250,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 0, bottom: 10, top: 5, right: 8.0),
//                                   child: SizedBox(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.99,
//                                     child: Text(
//                                       "Jannat-kay-baray-mein-sawal-jawab",
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold),
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                 ),
//                                 Text("Total pages: 17"),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text("Document: pdf"),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 GestureDetector(
//                                     onTap: () {
//                                       // downloadFile();
//                                     },
//                                     child: Text("Download Now")),
//                                 Text(downloadingStr),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     downloadFile(
//                                         "http://amaanattari.ddns.net:8000/media-api/public/books/jannat-kay-baray-mein-sawal-jawab.pdf");
//                                     // Map<Permission, PermissionStatus> statuses = await [
//                                     //   Permission.storage,
//                                     //   //add more permission to request here.
//                                     // ].request();

//                                     // if (statuses[Permission.storage]!.isGranted) {
//                                     //   var dir = await DownloadsPathProvider.downloadsDirectory;
//                                     //   if (dir != null) {
//                                     //     String savename = "file.pdf";
//                                     //     String savePath = dir.path + "/$savename";
//                                     //     print(savePath);
//                                     //     //output:  /storage/emulated/0/Download/banner.png

//                                     //     try {
//                                     //       await Dio().download(fileUrl, savePath,
//                                     //           onReceiveProgress: (received, total) {
//                                     //         if (total != -1) {
//                                     //           print((received / total * 100).toStringAsFixed(0) +
//                                     //               "%");
//                                     //           //you can build progressbar feature too
//                                     //         }
//                                     //       });
//                                     //       print("File is saved to download folder.");
//                                     //     } on DioError catch (e) {
//                                     //       print(e.message);
//                                     //     }
//                                     //   }
//                                     // } else {
//                                     //   print("No permission to read and write.");
//                                     // }
//                                   },
//                                   child: Text("Download File."),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       )