// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Usr {
  String id;
  String usr;
  String psw;
  String? name;
  String? doc;
  String? token;
  int usrType;
  Usr({
    required this.id,
    required this.usr,
    required this.psw,
    this.name,
    this.doc,
    this.token,
    required this.usrType,
  });

  Usr copyWith({
    String? id,
    String? usr,
    String? psw,
    String? name,
    String? doc,
    String? token,
    int? usrType,
  }) {
    return Usr(
      id: id ?? this.id,
      usr: usr ?? this.usr,
      psw: psw ?? this.psw,
      name: name ?? this.name,
      doc: doc ?? this.doc,
      token: token ?? this.token,
      usrType: usrType ?? this.usrType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'usr': usr,
      'psw': psw,
      'name': name,
      'doc': doc,
      'token': token,
      'usrType': usrType,
    };
  }

  factory Usr.fromMap(Map<String, dynamic> map) {
    return Usr(
      id: map['id'] as String,
      usr: map['usr'] as String,
      psw: map['psw'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      doc: map['doc'] != null ? map['doc'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      usrType: map['usrType'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usr.fromJson(String source) =>
      Usr.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Usr(id: $id, usr: $usr, psw: $psw, name: $name, doc: $doc, token: $token, usrType: $usrType)';
  }

  @override
  bool operator ==(covariant Usr other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.usr == usr &&
        other.psw == psw &&
        other.name == name &&
        other.doc == doc &&
        other.token == token &&
        other.usrType == usrType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        usr.hashCode ^
        psw.hashCode ^
        name.hashCode ^
        doc.hashCode ^
        token.hashCode ^
        usrType.hashCode;
  }
}
