import 'dart:io';

import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/home_screen.dart';
import 'package:async/async.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ModelUi extends StatefulWidget {
  ModelUi({
    Key? key,
  }) : super(key: key);

  @override
  _ModelUiState createState() => _ModelUiState();
}

class _ModelUiState extends State<ModelUi> {
  final TextEditingController _inputController = TextEditingController();
  String _output = '';
  String selectedFilePath = "No file selected";
  FilePickerResult? result;

  File? selectedFile;

  Future<void> uploadCsv() async {
    if (selectedFile == null) {
      print("Please select a CSV file first.");
      return;
    }

    final uri = Uri.parse(
        "http://localhost:8000/upload-csv/"); // Replace with your API endpoint

    var stream =
        new http.ByteStream(DelegatingStream.typed(selectedFile!.openRead()));
    var length = await selectedFile!.length();
    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(selectedFile!.path));

    request.files.add(multipartFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      print("CSV file uploaded successfully");
    } else {
      print("Failed to upload CSV file");
    }
  }

  Future<void> sendFile() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:8000/upload/'));
    request.files.add(http.MultipartFile(
        'file',
        File(selectedFile as String).readAsBytes().asStream(),
        File(selectedFilePath).lengthSync(),
        filename: 'file.csv'));
    var response = await request.send();

    if (response.statusCode == 200) {
      print('File sent successfully');
    } else {
      print('File upload failed with status code ${response.statusCode}');
    }
  }

  void pickFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      setState(() {
        selectedFilePath = result!.files.single.name;
        selectedFile = File(result!.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Series Model"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return HomeScreen();
                }));
              },
              child: Text(" Data Visualization"),
            ),
            ElevatedButton(
              onPressed: () {
                pickFile();
                uploadCsv();
              },
              child: Text('Upload your File '),
            ),
            Container(
              width: 600,
              padding: EdgeInsets.all(32),
              child: TextField(
                controller: _inputController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input',
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Get Prediction'),
            ),
            SizedBox(height: 16),
            Text(
              'Output: $_output',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
