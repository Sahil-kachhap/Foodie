import 'dart:convert';

import 'package:foodopia/core/utils/file_type_detector.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

class Post{
   String userId;
   String username;
   String postId;
   String caption;
   String contentType;
   String fileId;
   String createdAt;
   String updatedAt;

  Post({
    required this.username,
    required this.userId,
    required this.postId,
    required this.caption,
    required this.contentType,
    required this.fileId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      username: json['username'],
      userId: json['user_id'],
      postId: json['post_id'],
      caption: json['caption'],
      contentType: json['content_type'],
      fileId: json['file_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'post_id': postId,
      'caption': caption,
      'content_type': contentType.isImageFile ? 'image' : 'video',
      'file_id': fileId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}