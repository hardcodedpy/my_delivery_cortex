// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'ordem_entrega.g.dart';

@HiveType(typeId: 4)
class OrdemEntrega extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String localizador;
  @HiveField(2)
  String idMotoBoy;
  @HiveField(3)
  String idEstabelecimento;
  @HiveField(4)
  double custoEntrega;
  @HiveField(5)
  double custoCliente;
  @HiveField(6)
  String cep;
  @HiveField(7)
  String rua;
  @HiveField(8)
  String nmr;
  @HiveField(9)
  double? deliveryLat;
  @HiveField(10)
  double? deliveryLong;
  @HiveField(11)
  DateTime dthrCreated;
  @HiveField(12)
  DateTime? dthrAccepted;
  @HiveField(13)
  DateTime? dthrDelivered;
  @HiveField(14)
  DateTime? dthrProblem;
  @HiveField(15)
  DateTime? dthrCanceled;
  @HiveField(16)
  String? observation;
  @HiveField(17)
  double? motoboyLat;
  @HiveField(18)
  double? motoboyLong;

  OrdemEntrega({
    required this.id,
    required this.localizador,
    required this.idMotoBoy,
    required this.idEstabelecimento,
    required this.custoEntrega,
    required this.custoCliente,
    required this.cep,
    required this.rua,
    required this.nmr,
    this.deliveryLat,
    this.deliveryLong,
    required this.dthrCreated,
    this.dthrAccepted,
    this.dthrDelivered,
    this.dthrProblem,
    this.dthrCanceled,
    this.observation,
    this.motoboyLat,
    this.motoboyLong,
  });

  OrdemEntrega copyWith({
    String? id,
    String? localizador,
    String? idMotoBoy,
    String? idEstabelecimento,
    double? custoEntrega,
    double? custoCliente,
    String? cep,
    String? rua,
    String? nmr,
    double? deliveryLat,
    double? deliveryLong,
    DateTime? dthrCreated,
    DateTime? dthrAccepted,
    DateTime? dthrDelivered,
    DateTime? dthrProblem,
    DateTime? dthrCanceled,
    String? observation,
    double? motoboyLat,
    double? motoboyLong,
  }) {
    return OrdemEntrega(
      id: id ?? this.id,
      localizador: localizador ?? this.localizador,
      idMotoBoy: idMotoBoy ?? this.idMotoBoy,
      idEstabelecimento: idEstabelecimento ?? this.idEstabelecimento,
      custoEntrega: custoEntrega ?? this.custoEntrega,
      custoCliente: custoCliente ?? this.custoCliente,
      cep: cep ?? this.cep,
      rua: rua ?? this.rua,
      nmr: nmr ?? this.nmr,
      deliveryLat: deliveryLat ?? this.deliveryLat,
      deliveryLong: deliveryLong ?? this.deliveryLong,
      dthrCreated: dthrCreated ?? this.dthrCreated,
      dthrAccepted: dthrAccepted ?? this.dthrAccepted,
      dthrDelivered: dthrDelivered ?? this.dthrDelivered,
      dthrProblem: dthrProblem ?? this.dthrProblem,
      dthrCanceled: dthrCanceled ?? this.dthrCanceled,
      observation: observation ?? this.observation,
      motoboyLat: motoboyLat ?? this.motoboyLat,
      motoboyLong: motoboyLong ?? this.motoboyLong,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'localizador': localizador,
      'idMotoBoy': idMotoBoy,
      'idEstabelecimento': idEstabelecimento,
      'custoEntrega': custoEntrega,
      'custoCliente': custoCliente,
      'cep': cep,
      'rua': rua,
      'nmr': nmr,
      'deliveryLat': deliveryLat,
      'deliveryLong': deliveryLong,
      'dthrCreated': dthrCreated.millisecondsSinceEpoch,
      'dthrAccepted': dthrAccepted?.millisecondsSinceEpoch,
      'dthrDelivered': dthrDelivered?.millisecondsSinceEpoch,
      'dthrProblem': dthrProblem?.millisecondsSinceEpoch,
      'dthrCanceled': dthrCanceled?.millisecondsSinceEpoch,
      'observation': observation,
      'motoboyLat': motoboyLat,
      'motoboyLong': motoboyLong,
    };
  }

  factory OrdemEntrega.fromMap(Map<String, dynamic> map) {
    return OrdemEntrega(
      id: map['id'] as String,
      localizador: map['localizador'] as String,
      idMotoBoy: map['idMotoBoy'] as String,
      idEstabelecimento: map['idEstabelecimento'] as String,
      custoEntrega: map['custoEntrega'] as double,
      custoCliente: map['custoCliente'] as double,
      cep: map['cep'] as String,
      rua: map['rua'] as String,
      nmr: map['nmr'] as String,
      deliveryLat:
          map['deliveryLat'] != null ? map['deliveryLat'] as double : null,
      deliveryLong:
          map['deliveryLong'] != null ? map['deliveryLong'] as double : null,
      dthrCreated:
          DateTime.fromMillisecondsSinceEpoch(map['dthrCreated'] as int),
      dthrAccepted: map['dthrAccepted'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dthrAccepted'] as int)
          : null,
      dthrDelivered: map['dthrDelivered'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dthrDelivered'] as int)
          : null,
      dthrProblem: map['dthrProblem'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dthrProblem'] as int)
          : null,
      dthrCanceled: map['dthrCanceled'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dthrCanceled'] as int)
          : null,
      observation:
          map['observation'] != null ? map['observation'] as String : null,
      motoboyLat:
          map['motoboyLat'] != null ? map['motoboyLat'] as double : null,
      motoboyLong:
          map['motoboyLong'] != null ? map['motoboyLong'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdemEntrega.fromJson(String source) =>
      OrdemEntrega.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrdemEntrega(id: $id, localizador: $localizador, idMotoBoy: $idMotoBoy, idEstabelecimento: $idEstabelecimento, custoEntrega: $custoEntrega, custoCliente: $custoCliente, cep: $cep, rua: $rua, nmr: $nmr, deliveryLat: $deliveryLat, deliveryLong: $deliveryLong, dthrCreated: $dthrCreated, dthrAccepted: $dthrAccepted, dthrDelivered: $dthrDelivered, dthrProblem: $dthrProblem, dthrCanceled: $dthrCanceled, observation: $observation, motoboyLat: $motoboyLat, motoboyLong: $motoboyLong)';
  }

  @override
  bool operator ==(covariant OrdemEntrega other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.localizador == localizador &&
        other.idMotoBoy == idMotoBoy &&
        other.idEstabelecimento == idEstabelecimento &&
        other.custoEntrega == custoEntrega &&
        other.custoCliente == custoCliente &&
        other.cep == cep &&
        other.rua == rua &&
        other.nmr == nmr &&
        other.deliveryLat == deliveryLat &&
        other.deliveryLong == deliveryLong &&
        other.dthrCreated == dthrCreated &&
        other.dthrAccepted == dthrAccepted &&
        other.dthrDelivered == dthrDelivered &&
        other.dthrProblem == dthrProblem &&
        other.dthrCanceled == dthrCanceled &&
        other.observation == observation &&
        other.motoboyLat == motoboyLat &&
        other.motoboyLong == motoboyLong;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        localizador.hashCode ^
        idMotoBoy.hashCode ^
        idEstabelecimento.hashCode ^
        custoEntrega.hashCode ^
        custoCliente.hashCode ^
        cep.hashCode ^
        rua.hashCode ^
        nmr.hashCode ^
        deliveryLat.hashCode ^
        deliveryLong.hashCode ^
        dthrCreated.hashCode ^
        dthrAccepted.hashCode ^
        dthrDelivered.hashCode ^
        dthrProblem.hashCode ^
        dthrCanceled.hashCode ^
        observation.hashCode ^
        motoboyLat.hashCode ^
        motoboyLong.hashCode;
  }
}
