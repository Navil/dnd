import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  final Ref ref;
  final String uid;

  final userStorage = Supabase.instance.client.storage.from("users");

  StorageService(this.ref, this.uid);

  Future<String> uploadProfilePicture(XFile image) async {
    const filename = "profile-picture.jpg";

    final url = "$uid/$filename";
    await userStorage.upload(url, File(image.path),
        fileOptions: const FileOptions(upsert: true));
    return userStorage.getPublicUrl(url);
  }
}
