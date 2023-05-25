import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/select_images.dart';

class PhotoUpload extends StatefulWidget {
  const PhotoUpload({Key? key}) : super(key: key);

  @override
  State<PhotoUpload> createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<PhotoUpload> {
  late XFile? sampleImage = null;
  late String _myavalue;
  late final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cargar imagenes"),
        backgroundColor: const Color.fromARGB(255, 206, 105, 66),
        centerTitle: true,
      ),
      body: Center(
        child:
            sampleImage == null ? Text("Seleccionar imagen") : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "Add imagen",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future<XFile?> getImage() async {
    final ImagePicker picker = ImagePicker();
    var tempImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImage;
    });
  }

  Widget enableUpload() {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Descripcion"),
            )
          ],
        ),
      ),
    );
  }
}//fin dee clase


