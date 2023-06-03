class UserEntity {
  String? userId;
  String? name;
  String? email;
  String? password;

  UserEntity({this.name, this.email, this.password, this.userId});

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> map) {
    return UserEntity(
      userId: map['userId'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  @override
  String toString() {
    return 'UserEntity{name: $name, email: $email, password: $password}';
  }
}
