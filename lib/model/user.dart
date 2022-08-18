class UserData {
  String username;
  String email;
  String uid;
  UserData({required this.username, required this.email, required this.uid});
  Map<String, dynamic> toJson() =>
      {'username': username, 'email': email, 'uid': uid};
}
