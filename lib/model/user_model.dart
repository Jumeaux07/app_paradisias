class User {
  int? id;
  String? username;
  String? email;
  String? url;
  User({this.id, this.username, this.email, this.url});

  factory User.fromJson(Map<String, dynamic> j) {
    return User(
        id: j['id'], username: j['username'], email: j['email'], url: j['url']);
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "email": email,
        "url": url,
      };
}
