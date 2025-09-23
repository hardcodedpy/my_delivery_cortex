// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
part 'estabelecimento.g.dart';

@HiveType(typeId: 1)
class Estabelecimento extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String idOwner;
  @HiveField(2)
  String name;
  Estabelecimento({
    required this.id,
    required this.idOwner,
    required this.name,
  });

  Estabelecimento copyWith({
    String? id,
    String? idOwner,
    String? name,
  }) {
    return Estabelecimento(
      id: id ?? this.id,
      idOwner: idOwner ?? this.idOwner,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idOwner': idOwner,
      'name': name,
    };
  }

  factory Estabelecimento.fromMap(Map<String, dynamic> map) {
    return Estabelecimento(
      id: map['id'] as String,
      idOwner: map['idOwner'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Estabelecimento.fromJson(String source) =>
      Estabelecimento.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Estabelecimento(id: $id, idOwner: $idOwner, name: $name)';

  @override
  bool operator ==(covariant Estabelecimento other) {
    if (identical(this, other)) return true;

    return other.id == id && other.idOwner == idOwner && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ idOwner.hashCode ^ name.hashCode;
}
