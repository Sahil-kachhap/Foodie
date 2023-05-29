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
      userId: json['\$id'],
      profileId: json['\$collection'],
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      bio: json['bio'],
      createdAt: json['\$permissions']['\$created'],
      updatedAt: json['\$permissions']['\$updated'],
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
