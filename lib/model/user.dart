import 'dart:convert';

class User {
  String? id;
  String? phoneNumber;
  String? email;
  String? name;
  bool? isActive;
  bool? isVerified;
  String? phoneConfirmendAt;
  String? emailConfirmedAt;
  String? avatarUrl;
  User({
    this.id,
    this.phoneNumber,
    this.email,
    this.name,
    this.isActive,
    this.isVerified,
    this.phoneConfirmendAt,
    this.emailConfirmedAt,
    this.avatarUrl,
  });

  User copyWith({
    String? id,
    String? phoneNumber,
    String? email,
    String? name,
    bool? isActive,
    bool? isVerified,
    String? phoneConfirmendAt,
    String? emailConfirmedAt,
    String? avatarUrl,
  }) {
    return User(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      isVerified: isVerified ?? this.isVerified,
      phoneConfirmendAt: phoneConfirmendAt ?? this.phoneConfirmendAt,
      emailConfirmedAt: emailConfirmedAt ?? this.emailConfirmedAt,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phoneNumber': phoneNumber,
      'email': email,
      'name': name,
      'isActive': isActive,
      'isVerified': isVerified,
      'phoneConfirmendAt': phoneConfirmendAt,
      'emailConfirmedAt': emailConfirmedAt,
      'avatarUrl': avatarUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
      isVerified: map['isVerified'] != null ? map['isVerified'] as bool : null,
      phoneConfirmendAt: map['phoneConfirmendAt'] != null
          ? map['phoneConfirmendAt'] as String
          : null,
      emailConfirmedAt: map['emailConfirmedAt'] != null
          ? map['emailConfirmedAt'] as String
          : null,
      avatarUrl: map['avatarUrl'] != null ? map['avatarUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, phoneNumber: $phoneNumber, email: $email, name: $name, isActive: $isActive, isVerified: $isVerified, phoneConfirmendAt: $phoneConfirmendAt, emailConfirmedAt: $emailConfirmedAt, avatarUrl: $avatarUrl)';
  }
}
