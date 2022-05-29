import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';


import 'package:decorated_icon/decorated_icon.dart';
import 'package:bird_app/presentation/my_flutter_app_icons.dart';

class BtnImagePicker extends StatefulWidget {
  const BtnImagePicker({Key? key}) : super(key: key);

  @override
  State<BtnImagePicker> createState() => _BtnImagePickerState();
}

class _BtnImagePickerState extends State<BtnImagePicker> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;


      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 25),
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 80,
          height: 75,
          child: InkWell(
            onTap: () async {
              final source = await showImageSource(context);
              if (source == null) return;

              pickImage(source);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                CustomIcons.image,
                size: 40.0,
                color: Colors.white70,
              ),
            ),
          ),
        ),
    );

    //   Scaffold(
    //   backgroundColor: Colors.amber.shade300,
    //   body: Container(
    //     padding: EdgeInsets.all(32),
    //     child: Column(
    //       children: [
    //         Spacer(),
    //         // image != null
    //         //     ? ImageWidget(
    //         //   image: image!,
    //         //   onClicked: (source) => pickImage(source),
    //         // )
    //         //     : FlutterLogo(size: 160),
    //         const SizedBox(height: 24),
    //         Text(
    //           'Image Picker',
    //           style: TextStyle(
    //             fontSize: 48,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         const SizedBox(height: 48),
    //         buildButton(
    //           title: 'Pick Gallery',
    //           icon: Icons.image_outlined,
    //           onClicked: () => pickImage(ImageSource.gallery),
    //         ),
    //         const SizedBox(height: 24),
    //         buildButton(
    //           title: 'Pick Camera',
    //           icon: Icons.camera_alt_outlined,
    //           onClicked: () => pickImage(ImageSource.camera),
    //         ),
    //         Spacer(),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(56),
          primary: Colors.white,
          onPrimary: Colors.black,
          textStyle: TextStyle(fontSize: 20),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 16),
            Text(title),
          ],
        ),
        onPressed: onClicked,
      );

  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: Text('Camera'),
              onPressed: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            CupertinoActionSheetAction(
              child: Text('Gallery'),
              onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
        ),
      );
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            )
          ],
        ),
      );
    }
  }


}
