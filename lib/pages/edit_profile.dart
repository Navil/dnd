import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dnd/model/player.dart';
import 'package:dnd/providers/supabase_provider.dart';
import 'package:dnd/providers/user_profile_provider.dart';
import 'package:dnd/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final TextEditingController _firstnameController = TextEditingController();
  String? _photoURL;
  XFile? _newImage;

  final List<String> _errors = [];

  Player? _player;

  @override
  Widget build(BuildContext context) {

    //AsyncValue<Player?> playerDetails = ref.read(playerDetailsProvider(null));
    // Listen to the userProfileProvider
  
    return WillPopScope(
      onWillPop: () async {
        return _player != null;
      },
      child: Scaffold(
          appBar: AppBar(
              title: const Text("Edit profile"),
              automaticallyImplyLeading: _player != null),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _getProfilePictureWidget(),
                  TextField(
                    controller: _firstnameController,
                    decoration: const InputDecoration(
                      label: Text("Firstname"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Column(
                    children: [
                      if (_errors.isNotEmpty)
                        ..._errors.map((error) => Text(error)).toList(),
                      SizedBox(
                        height: 48,
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                          onPressed: () {
                            _errors.clear();
                            if (_firstnameController.text.isEmpty) {
                              _errors.add("Please provide a name.");
                            }
                            if (_newImage == null && _photoURL == null) {
                              _errors.add("Please provide a photo.");
                            }

                            if (_errors.isNotEmpty) {
                              setState(() {});
                            } else {
                              Player player = _player ?? Player.empty();
                              player.firstname = _firstnameController.text;
                              ref.read(supabaseProvider).savePlayer(player);
                              //Do upload
                              GoRouter.of(context).pop();
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      )
                    ],
                  )
                ],
              )
                
            
          )),
    );
  }

  _getProfilePictureWidget() {
    const imageSize = 150.0;

    return Container(
      margin: const EdgeInsets.all(16),
      width: imageSize,
      height: imageSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _newImage == null
              ? UserAvatar(url: _photoURL, radius: imageSize / 2)
              : CircleAvatar(
                  radius: imageSize / 2,
                  backgroundColor: Colors.transparent,
                  backgroundImage: FileImage(
                    File(_newImage!.path),
                  ),
                ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
                onTap: () => importImage(context),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 25,
                  child: const FaIcon(
                    FontAwesomeIcons.image,
                    size: 25,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
    );
  }

  void importImage(BuildContext context) async {
    try {
      var imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(
          source: ImageSource.gallery, requestFullMetadata: false);
      if (file == null) return;

      await cropImage(file.path);
    } on PlatformException catch (error) {
      if (error.code == 'photo_access_denied' && mounted) {
        await showOkAlertDialog(
            context: context,
            message:
                "You must give this application permission to access your photos.");
      }
    }
  }

  Future<void> cropImage(String path) async {
    CroppedFile? croppedFile = await cropImageByPath(path, context);
    if (croppedFile == null) return;

    setState(() {
      _newImage = XFile(croppedFile.path);
      _photoURL = null;
    });
  }

  Future<CroppedFile?> cropImageByPath(
      String path, BuildContext context) async {
    ImageCropper cropper = ImageCropper();
    CroppedFile? croppedFile = await cropper.cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
            toolbarColor: Theme.of(context).primaryColor,
            cropFrameColor: Theme.of(context).primaryColor,
            toolbarWidgetColor: Colors.white,
            hideBottomControls: true),
        IOSUiSettings(
            aspectRatioPickerButtonHidden: true,
            resetButtonHidden: true,
            rotateButtonsHidden: true,
            rotateClockwiseButtonHidden: true,
            aspectRatioLockEnabled: true,
            resetAspectRatioEnabled: false)
      ],
      aspectRatioPresets: [CropAspectRatioPreset.square],
      compressQuality: 100,
      maxWidth: 600,
      maxHeight: 600,
    );
    return croppedFile;
  }

  @override
  void dispose() {
    super.dispose();
    _firstnameController.dispose();
  }
}
