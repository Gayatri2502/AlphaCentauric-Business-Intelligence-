import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LinearModel(),
    );
  }
}

class LinearModel extends StatefulWidget {
  @override
  _LinearModelState createState() => _LinearModelState();
}

class _LinearModelState extends State<LinearModel> {
  String imageFilePath = 'asset/base_pic.svg'; // default image path
  TextEditingController value1Controller = TextEditingController();
  TextEditingController value2Controller = TextEditingController();
  TextEditingController value3Controller = TextEditingController();
  String responseData = '';
  String imagePath = '';
  String serverUrl = 'http://127.0.0.1:5000';
  // void sendRequest() async {
  //   const String apiUrl = 'http://127.0.0.1:5000/linear_model';
  //
  //   try {
  //     final http.Client client = http.Client();
  //     final http.Request request = http.Request('POST', Uri.parse(apiUrl))
  //       ..headers['Content-Type'] = 'application/json'
  //       ..body = json.encode({'text': inputController.text});
  //     print("Hi , you have a request ${request}");
  //
  //     final http.StreamedResponse streamedResponse = await client.send(request);
  //     final http.Response response =
  //         await http.Response.fromStream(streamedResponse);
  //     print("now you got response ${response}");
  //     print(response.statusCode); // Print the status code
  //
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = json.decode(response.body);
  //       print(responseData);
  //
  //       setState(() {
  //         if (responseData.containsKey('image_path')) {
  //           imageFilePath = responseData['image_path'];
  //         } else {
  //           print('Error: ${responseData['error']}');
  //         }
  //       });
  //     } else {
  //       print('Error: ${response.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     // handle exception
  //     print('Exception: $e');
  //   }
  // }
  Future<void> sendDataToServer() async {
    String value1 = value1Controller.text;
    String value2 = value2Controller.text;
    String value3 = value3Controller.text;

    int intValue1 = int.tryParse(value1) ?? 0;
    int intValue2 = int.tryParse(value2) ?? 0;
    int intValue3 = int.tryParse(value3) ?? 0;

    String commaSeparatedInput = '$intValue1,$intValue2,$intValue3';

    print('${commaSeparatedInput}');

    // List<String> values = commaSeparatedInput.split(',');
    // if (values.length != 3) {
    //   print(
    //       'Invalid input format. Please provide three comma-separated integers.');
    //   return;
    // }
    // print('${values}');
    // // int intValue1 = int.tryParse(values[0]) ?? 0;
    // // int intValue2 = int.tryParse(values[1]) ?? 0;
    // // int intValue3 = int.tryParse(values[2]) ?? 0;
    // //
    // // Map<String, dynamic> data = {
    // //   'value1': value1,
    // //   'value2': value2,
    // //   'value3': value3,
    // // };
    //
    // // print('${data}');

    String jsonData = jsonEncode(commaSeparatedInput);

    try {
      final http.Response response = await http.post(
        Uri.parse('$serverUrl/linear_model'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        setState(() {
          responseData = response.body;
        });

        print('Response from server: $responseData');
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<void> downloadImage(String imageUrl) async {
  //   try {
  //     Dio dio = Dio();
  //     Response response = await dio.get(imageUrl,
  //         options: Options(responseType: ResponseType.bytes));
  //
  //     String path = await _localPath;
  //     String filePath = '$path/downloaded_image.png';
  //
  //     await File(filePath).writeAsBytes(response.data);
  //
  //     // Now you can use 'filePath' to display the image in your Flutter app.
  //   } catch (error) {
  //     print('Error downloading image: $error');
  //   }
  // }
  //
  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }
  Future<void> downloadAndDisplayImage() async {
    try {
      Dio dio = Dio();
      Response response = await dio
          .post('$serverUrl/linear_model', data: {'imageName': 'path'});
      String imageName = response.data['imageName'];
      String imageUrl = '${serverUrl}/static/$imageName';

      setState(() {
        imagePath = imageUrl;
      });
    } catch (error) {
      print('Error downloading image: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SvgPicture.network(imageFilePath),
              Text('Response: $responseData'),
              imagePath != null
                  ? Image.network(imagePath, fit: BoxFit.cover)
                  : CircularProgressIndicator(),
              Row(
                children: [
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: Text('Show prediction'),
                  // ),

                  SizedBox(height: 10),
                  Expanded(
                    child: TextField(
                      controller: value1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Value 1'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: value2Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Value 2'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: value3Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Value 3'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: sendDataToServer,
                child: Text('Send Data to Server'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
