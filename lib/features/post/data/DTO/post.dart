import 'dart:convert';
import 'package:foodopia/core/utils/constants.dart';
import 'package:foodopia/core/utils/file_type_detector.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

class Post{
   String? id;
   String userId;
   String username;
   String caption;
   String contentType;
   String fileId;
   List<String> likes;
   List<String> commentIds;
   String fileUrl;
   String createdAt;
   String updatedAt;

  Post({
    required this.username,
    this.id,
    required this.userId,
    required this.caption,
    required this.contentType,
    required this.fileId,
    this.likes = const [],
    this.commentIds = const [],
    required this.fileUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['\$id'],
      username: json['username'],
      userId: json['user_id'],
      caption: json['caption'],
      contentType: json['content_type'],
      fileId: json['file_id'],
      likes: List<String>.from(json['likes']),
      commentIds: List<String>.from(json['commentsIds']),
      fileUrl: json['file_url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'caption': caption,
      'content_type': contentType.isImageFile ? 'image' : 'video',
      'file_id': fileId,
      'likes': likes,
      'commentsIds': commentIds,
      'file_url': imageUrl(fileId),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}