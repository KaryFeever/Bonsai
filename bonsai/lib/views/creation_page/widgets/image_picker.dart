import 'dart:io';

import 'package:bonsai/views/creation_page/widgets/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../utils/styles.dart';

final imageHelper = ImageHelper();

class ImagePicker extends StatefulWidget {
  const ImagePicker({
    super.key,
  });
  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 16.0,
          right: 20.0,
          left: 20.0,
          bottom: 26.0,
        ),
        child: GestureDetector(
          onTap: () async {
            final file = await imageHelper.pickImage();
            if (file != null) {
              final croppedFile = await imageHelper.crop(
                  file: file, cropStyle: CropStyle.rectangle);
              if (croppedFile != null) {
                setState(() {
                  _image = File(croppedFile.path);
                });
              }
            }
          },
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              border: Border.all(
                color: Color(0x33979797),
                width: 1,
              ),
              color: Styles.fieldsBackgroundColor,
              image: _image != null
                  ? DecorationImage(
                      image: FileImage(_image!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: _image == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 11.0),
                        child: SvgPicture.asset(
                          "assets/icons/gallery.svg",
                        ),
                      ),
                      Text(
                        "Add photo for your plant",
                        style: Styles.inputText,
                      )
                    ],
                  )
                : null,
          ),
        ));
  }
}
