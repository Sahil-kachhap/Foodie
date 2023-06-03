import 'dart:typed_data';

class PostEntity{
  final String caption;
  final Uint8List file;
  final String userName;
  final String timeAgo;

  PostEntity(this.caption, this.file, this.timeAgo, this.userName);
}