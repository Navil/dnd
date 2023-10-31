import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/model/player.dart';
import 'package:dnd/providers/auth_provider.dart';
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
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final TextEditingController _firstnameController = TextEditingController();
  String? _photoURL;
  XFile? _newImage;

  Player? _player;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(authUserProvider).value?.id;
    if (userId == null) {
      return const AdaptiveLoadingIndicator();
    }

    Player? playerDetails = ref.watch(playerDetailsProvider(userId)).value;
    if (playerDetails != null && _player == null) {
      _player = playerDetails;
      _firstnameController.text = playerDetails.firstname;
    }

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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _getProfilePictureWidget(),
                    TextFormField(
                      controller: _firstnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text("Firstname (required)"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Player player = _player ?? Player.empty(userId);
                            player.firstname = _firstnameController.text;
                            ref.read(supabaseProvider).savePlayer(player);
                            //Do upload
                            if (_newImage != null) {
                              print(await Supabase.instance.client.storage
                                  .from("/players")
                                  .upload(userId, File(_newImage!.path)));
                            }
                            if (mounted) {
                              GoRouter.of(context).pop();
                            }
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  _getProfilePictureWidget() {
    const imageSize = 150.0;

    return Column(
      children: [
        const Text("Profile Picture"),
        Container(
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
        ),
      ],
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
      maxWidth: 250,
      maxHeight: 250,
    );
    return croppedFile;
  }

  @override
  void dispose() {
    super.dispose();
    _firstnameController.dispose();
  }
}
