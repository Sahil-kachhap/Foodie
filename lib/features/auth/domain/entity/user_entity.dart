class UserEntity{
  final String? name;
  final String? email;
  final String? password;

  UserEntity({this.name, this.email, this.password});

  @override
  String toString() {
    return 'UserEntity{name: $name, email: $email, password: $password}';
  }
}