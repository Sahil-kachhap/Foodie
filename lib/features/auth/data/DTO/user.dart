class AppUser {
  String userId;
  String profileId;
  String name;
  String email;
  String avatarUrl;
  String bio;
  String createdAt;
  String updatedAt;

  AppUser({
    required this.userId,
    required this.profileId,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.bio,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      userId: json['userId'],
      profileId: json['profileId'],
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      bio: json['bio'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'userId': userId,
      'profileId': profileId,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'bio': bio,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
