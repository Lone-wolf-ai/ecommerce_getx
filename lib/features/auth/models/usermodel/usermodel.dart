// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phoneNumber;
  String profilePic;
  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePic,
  });

  UserModel copyWith({
    String? id,
    String? firstname,
    String? lastname,
    String? username,
    String? email,
    String? phoneNumber,
    String? profilePic,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePic': profilePic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      profilePic: map['profilePic'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, firstname: $firstname, lastname: $lastname, username: $username, email: $email, phoneNumber: $phoneNumber, profilePic: $profilePic)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.firstname == firstname &&
      other.lastname == lastname &&
      other.username == username &&
      other.email == email &&
      other.phoneNumber == phoneNumber &&
      other.profilePic == profilePic;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstname.hashCode ^
      lastname.hashCode ^
      username.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      profilePic.hashCode;
  }
}
