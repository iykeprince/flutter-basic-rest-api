// ignore: file_names
// ignore_for_file: file_names

class User {
  int id;
  String username;
  String email;
  String phone;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        phone: json['phone'],
        email: json['email']);
  }

  @override
  String toString() {
    return 'id: $id, username: $username, phone: $phone';
  }
}
