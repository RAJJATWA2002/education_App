import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Certificates extends StatefulWidget {
  @override
  _Certificates createState() => _Certificates();
}

class _Certificates extends State<Certificates> {
  double _progress = 0.0; // Initialize progress
  final String url = 'https://www.learningcontainer.com/wp-content/uploads/2020/04/sample-text-file.txt';
  // final String url =
      // 'https://raw.githubusercontent.com/flutter/flutter/master/examples/flutter_gallery/assets/README.md';
  // final String url =
  //     'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';

  final List<Map<String, String>> items = [
    {'cntHeading': 'Deep Learning with TensorFlow'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff666d73),
      appBar: AppBar(
        toolbarHeight: 106,
        backgroundColor: Color(0Xff666d73),
        leading: Padding(
          padding: EdgeInsets.only(left: 33.0),
          child: BackButton(
            color: Color(0XFFFFFFFF),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 34.0),
          child: Text(
            'Certificates',
            style: TextStyle(color: Color(0XFFFFFFFF)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 33.0),
            child: Image.asset(
              'assets/icons/certificate.png',
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        margin: EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              height: 120,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Color(0XFF363E40),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items[index]['cntHeading']!,
                    style: TextStyle(
                      color: Color(0XFFF2F2F2),
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0XFF3E32FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Download certificate',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              color: Color(0XFFFFFFFF),
                            ),
                          ),
                        ),
                        onTap: () {
                          FileDownloader.downloadFile(
                            url: url,
                            name: "sample-text-file", // Specify a valid file name
                            onProgress: (name, progress) {
                              print('Progress:$progress');
                              setState(() {
                                _progress = progress; // Update progress
                              });
                            },
                            onDownloadCompleted: (path) {
                              print('File downloaded to path: $path');
                              setState(() {
                                _progress = 0.0;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Download completed: $path'),
                                ),
                              );
                            },
                            onDownloadError: (errorMessage) {
                              print('Download error: $errorMessage');
                              setState(() {
                                _progress = 0.0;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Download Failed: $errorMessage'),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Image.asset('assets/icons/forwardicon.png')
                    ],
                  ),

                  _progress != 0.0
                      ? LinearProgressIndicator(
                    value: _progress,
                    color: Colors.blue,
                    backgroundColor: Colors.grey,

                  )
                      : Container(), // Show progress bar if downloading
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}