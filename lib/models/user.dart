import 'dart:convert';

class User {
  final String? id;
  final String fullname;
  final String username;
  final String email;
  final String password;
  User({
    this.id,
    required this.fullname,
    required this.username,
    required this.email,
    required this.password,
  });

  User copyWith({
    String? id,
    String? fullname,
    String? username,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      fullname: map['fullname'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, fullname: $fullname, username: $username, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.fullname == fullname &&
        other.username == username &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullname.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
