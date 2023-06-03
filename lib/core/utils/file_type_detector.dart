import 'package:path/path.dart' as path;

extension FileExtensionChecker on String {
  bool get isImageFile {
    final extension = path.extension(this).toLowerCase();
    return extension == '.jpg' ||
        extension == '.jpeg' ||
        extension == '.png' ||
        extension == '.gif' ||
        extension == '.webp';
  }

  bool get isVideoFile {
    final extension = path.extension(this).toLowerCase();
    return extension == '.mp4' ||
        extension == '.mov' ||
        extension == '.avi' ||
        extension == '.mkv' ||
        extension == '.wmv';
  }
}
