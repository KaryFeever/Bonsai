import 'dart:io';

import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/views/creation_page/widgets/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../constants/styles.dart';

final imageHelper = ImageHelper();

class ImagePicker extends StatefulWidget with GetItStatefulWidgetMixin {
  ImagePicker({
    required this.image_path,
    required this.controller,
  });
  String image_path;
  final controller;
  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> with GetItStateMixin {
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
                  widget.image_path = croppedFile.path;
                  // TODO
                  widget.controller.setImagePath(widget.image_path);
                  print(widget.image_path);
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
              image: widget.image_path != ""
                  ? DecorationImage(
                      image: FileImage(File(widget.image_path)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: widget.image_path == ""
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
