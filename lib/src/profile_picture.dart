import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ProfilePicture extends StatefulWidget {
  Function(String value) newImagePath;
  String defaultImage;
  Color iconColor;
  ProfilePicture(
      {super.key,
      required this.newImagePath,
      required this.defaultImage,
      required this.iconColor});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  bool isfileEmpty = true;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  Future<void> getImageFromGallery(Function(String value) type) async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        type(image!.path);
        isfileEmpty = false;
      });
    }
  }

  Future<void> getImageFromCamera(Function(String value) type) async {
    image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        type(image!.path);
        isfileEmpty = false;
      });
    }
  }

  TextStyle styling = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;

    return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
            child: isfileEmpty == false
                ? Container(
                    height: device.width / 1.9,
                    width: device.width / 1.9,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FileImage(File(image!.path)),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            shape: BoxShape.circle,
                            color: Colors.white),
                        child: CircleAvatar(
                          backgroundColor: widget.iconColor,
                          radius: device.width / 16,
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              size: device.width / 14,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(5.0),
                                    ),
                                  ),
                                  context: context,
                                  elevation: 3,
                                  enableDrag: false,
                                  builder: ((context) {
                                    return SizedBox(
                                        height: device.height / 5,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextButton.icon(
                                              onPressed: () {
                                                getImageFromGallery(
                                                    widget.newImagePath);

                                                Navigator.pop(context);
                                              },
                                              label: const Text(
                                                "Upload Image",
                                                style: TextStyle(
                                                    fontFamily: "Open Sans",
                                                    color: Color.fromARGB(
                                                        255, 46, 44, 44),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              icon: Icon(
                                                Icons.image_rounded,
                                                size: device.width / 14,
                                                color: const Color.fromARGB(
                                                    255, 46, 44, 44),
                                              ),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {
                                                getImageFromCamera(
                                                    widget.newImagePath);

                                                Navigator.pop(context);
                                              },
                                              label: const Text(
                                                "Take Photo",
                                                style: TextStyle(
                                                    fontFamily: "Open Sans",
                                                    color: Color.fromARGB(
                                                        255, 46, 44, 44),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              icon: Icon(
                                                Icons.camera_alt_sharp,
                                                size: device.width / 14,
                                                color: const Color.fromARGB(
                                                    255, 46, 44, 44),
                                              ),
                                            ),
                                          ],
                                        ));
                                  }));
                            },
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: device.width / 1.9,
                    width: device.width / 1.9,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(widget.defaultImage),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            shape: BoxShape.circle,
                            color: Colors.white),
                        child: CircleAvatar(
                          backgroundColor: widget.iconColor,
                          radius: device.width / 16,
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              size: device.width / 14,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(5.0),
                                    ),
                                  ),
                                  context: context,
                                  elevation: 3,
                                  enableDrag: false,
                                  builder: ((context) {
                                    return SizedBox(
                                        height: device.height / 5,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextButton.icon(
                                              onPressed: () {
                                                getImageFromGallery(
                                                    widget.newImagePath);

                                                Navigator.pop(context);
                                              },
                                              label: const Text(
                                                "Upload Image",
                                                style: TextStyle(
                                                    fontFamily: "Open Sans",
                                                    color: Color.fromARGB(
                                                        255, 46, 44, 44),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              icon: Icon(
                                                Icons.image_rounded,
                                                size: device.width / 14,
                                                color: const Color.fromARGB(
                                                    255, 46, 44, 44),
                                              ),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {
                                                getImageFromCamera(
                                                    widget.newImagePath);

                                                Navigator.pop(context);
                                              },
                                              label: const Text(
                                                "Take Photo",
                                                style: TextStyle(
                                                    fontFamily: "Open Sans",
                                                    color: Color.fromARGB(
                                                        255, 46, 44, 44),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              icon: Icon(
                                                Icons.camera_alt_sharp,
                                                size: device.width / 14,
                                                color: const Color.fromARGB(
                                                    255, 46, 44, 44),
                                              ),
                                            ),
                                          ],
                                        ));
                                  }));
                            },
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )));
  }
}
