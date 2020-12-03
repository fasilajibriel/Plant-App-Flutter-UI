class Requests {
  final int id;
  final int userId;
  final String content;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  Requests({this.id, this.userId, this.content, this.firstName, this.lastName, this.phoneNumber});

  factory Requests.fromJson(Map<String, dynamic> json) {
    return Requests(
      id: json['id'],
      userId: json['user_id'],
      content: json['content'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number']
    );
  }
}