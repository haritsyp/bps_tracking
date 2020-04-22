// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String status;
    Data data;

    User({
        this.status,
        this.data,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String name;
    String email;
    String token;

    Data({
        this.name,
        this.email,
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "token": token,
    };
}
