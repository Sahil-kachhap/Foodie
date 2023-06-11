import 'dart:typed_data';

class PostEntity {
  final String caption;
  final Uint8List file;
  final String userName;
  final String timeAgo;

  PostEntity(this.caption, this.file, this.timeAgo, this.userName);

  Map<String, dynamic> toJson() {
    return {
      "caption": caption,
      "file": file,
      "timeAgo": timeAgo,
      "userName": userName,
    };
  }

  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return PostEntity(
      json['caption'],
      json['file'],
      json['timeAgo'],
      json['userName'],
    );
  }
}
