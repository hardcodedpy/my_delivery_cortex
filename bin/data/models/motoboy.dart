// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
part 'motoboy.g.dart';

@HiveType(typeId: 3)
class Motoboy extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String idUsr;
  @HiveField(2)
  String placa;
  @HiveField(3)
  String motoCor;
  Motoboy({
    required this.id,
    required this.idUsr,
    required this.placa,
    required this.motoCor,
  });

  Motoboy copyWith({
    String? id,
    String? idUsr,
    String? placa,
    String? motoCor,
  }) {
    return Motoboy(
      id: id ?? this.id,
      idUsr: idUsr ?? this.idUsr,
      placa: placa ?? this.placa,
      motoCor: motoCor ?? this.motoCor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idUsr': idUsr,
      'placa': placa,
      'motoCor': motoCor,
    };
  }

  factory Motoboy.fromMap(Map<String, dynamic> map) {
    return Motoboy(
      id: map['id'] as String,
      idUsr: map['idUsr'] as String,
      placa: map['placa'] as String,
      motoCor: map['motoCor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Motoboy.fromJson(String source) =>
      Motoboy.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Motoboy(id: $id, idUsr: $idUsr, placa: $placa, motoCor: $motoCor)';
  }

  @override
  bool operator ==(covariant Motoboy other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.idUsr == idUsr &&
        other.placa == placa &&
        other.motoCor == motoCor;
  }

  @override
  int get hashCode {
    return id.hashCode ^ idUsr.hashCode ^ placa.hashCode ^ motoCor.hashCode;
  }
}
