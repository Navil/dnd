import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/model/user.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:dnd/providers/storage_provider.dart';
import 'package:dnd/utils/capitalize.dart';
import 'package:dnd/utils/datetime_utils.dart';
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
  double _experienceLevel = 0;

  UserModel? _user;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(authUserProvider).value?.id;
    if (userId == null) {
      return const AdaptiveLoadingIndicator();
    }
    UserModel? userDetails = ref.watch(userProfileProvider(userId)).value;
    if (userDetails != null && _user == null) {
      _user = userDetails;
      _firstnameController.text = userDetails.firstname;
      _photoURL = userDetails.pictureUrl;
      _experienceLevel = ExperienceLevel.values
          .indexOf(userDetails.experienceLevel)
          .toDouble();
    }

    return WillPopScope(
      onWillPop: () async {
        return _user != null;
      },
      child: Scaffold(
          appBar: AppBar(
              title: const Text("Edit profile"),
              automaticallyImplyLeading: _user != null),
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
                    Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "What is your experience?",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Slider.adaptive(
                            value: _experienceLevel,
                            label: ExperienceLevel
                                .values[_experienceLevel.toInt()].name
                                .capitalize(),
                            divisions: ExperienceLevel.values.length - 1,
                            max: ExperienceLevel.values.length.toDouble() - 1,
                            onChanged: (double value) {
                              setState(() {
                                _experienceLevel = value;
                              });
                            }),
                        Text(ExperienceLevel
                            .values[_experienceLevel.toInt()].name
                            .capitalize())
                      ],
                    ),
                    SizedBox(
                      height: 48,
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String? newImageUrl;
                            //Do upload
                            if (_newImage != null) {
                              newImageUrl = await ref
                                  .read(storageServiceProvider)
                                  .uploadProfilePicture(_newImage!);
                            }
                            final now = DateTime.timestamp();
                            final firstname = _firstnameController.text;
                            final experienceLevel = ExperienceLevel
                                .values[_experienceLevel.toInt()];
                            final timezoneOffset =
                                DateTimeUtils.getTimezoneOffset();

                            UserModel user = _user != null
                                ? _user!.copyWith(
                                    id: userId,
                                    firstname: firstname,
                                    pictureUrl:
                                        newImageUrl ?? _user!.pictureUrl,
                                    experienceLevel: experienceLevel,
                                    lastOnline: now,
                                    timezoneOffset: timezoneOffset)
                                : UserModel(
                                    id: userId,
                                    firstname: firstname,
                                    createdAt: now,
                                    pictureUrl: newImageUrl,
                                    experienceLevel: experienceLevel,
                                    lastOnline: now,
                                    timezoneOffset: timezoneOffset);

                            ref.read(databaseServiceProvider).saveUser(user);

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
