// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> uploadImageAndSaveUrl(
    FFUploadedFile file, int predictionid) async {
  final supabase = Supabase.instance.client;

  try {
    if (file.bytes == null || file.bytes!.isEmpty) {
      throw Exception("File data is empty.");
    }

    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception("User must be authenticated to upload.");
    }

    // Generate unique filename
    final String fileName =
        'meal/${DateTime.now().millisecondsSinceEpoch}_${user.id}.jpg';

    // Upload image to Supabase Storage
    await supabase.storage
        .from('uploadMedia') // Bucket Name
        .uploadBinary(fileName, file.bytes!);

    // Get public URL of the uploaded image
    final String imageUrl =
        supabase.storage.from('uploadMedia').getPublicUrl(fileName);

    // Update ONLY the most recent meal for the user
    final response = await supabase
        .from('upload_img')
        .update({'img': imageUrl}).eq('id', predictionid);

    debugPrint("Image uploaded and latest meal updated.");
  } catch (e) {
    debugPrint("Error uploading image or updating database: $e");
  }
}
