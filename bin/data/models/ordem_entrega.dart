// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import './location.dart';

class OrdemEntrega {
  String id;
  String localizador;
  String idMotoBoy;
  String idEstabelecimento;
  double custoEntrega;
  double custoCliente;
  String cep;
  String rua;
  String nmr;
  Location? deliveryLocation;
  Location? ultimaLocMotoboy;
  DateTime dthrCreated;
  DateTime? dthrAccepted;
  DateTime? dthrDelivered;
  DateTime? dthrProblem;
  DateTime? dthrCanceled;
  String? observation;
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
    this.deliveryLocation,
    this.ultimaLocMotoboy,
    required this.dthrCreated,
    this.dthrAccepted,
    this.dthrDelivered,
    this.dthrProblem,
    this.dthrCanceled,
    this.observation,
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
    Location? deliveryLocation,
    Location? ultimaLocMotoboy,
    DateTime? dthrCreated,
    DateTime? dthrAccepted,
    DateTime? dthrDelivered,
    DateTime? dthrProblem,
    DateTime? dthrCanceled,
    String? observation,
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
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      ultimaLocMotoboy: ultimaLocMotoboy ?? this.ultimaLocMotoboy,
      dthrCreated: dthrCreated ?? this.dthrCreated,
      dthrAccepted: dthrAccepted ?? this.dthrAccepted,
      dthrDelivered: dthrDelivered ?? this.dthrDelivered,
      dthrProblem: dthrProblem ?? this.dthrProblem,
      dthrCanceled: dthrCanceled ?? this.dthrCanceled,
      observation: observation ?? this.observation,
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
      'deliveryLocation': deliveryLocation?.toMap(),
      'ultimaLocMotoboy': ultimaLocMotoboy?.toMap(),
      'dthrCreated': dthrCreated.millisecondsSinceEpoch,
      'dthrAccepted': dthrAccepted?.millisecondsSinceEpoch,
      'dthrDelivered': dthrDelivered?.millisecondsSinceEpoch,
      'dthrProblem': dthrProblem?.millisecondsSinceEpoch,
      'dthrCanceled': dthrCanceled?.millisecondsSinceEpoch,
      'observation': observation,
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
      deliveryLocation: map['deliveryLocation'] != null
          ? Location.fromMap(map['deliveryLocation'] as Map<String, dynamic>)
          : null,
      ultimaLocMotoboy: map['ultimaLocMotoboy'] != null
          ? Location.fromMap(map['ultimaLocMotoboy'] as Map<String, dynamic>)
          : null,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdemEntrega.fromJson(String source) =>
      OrdemEntrega.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrdemEntrega(id: $id, localizador: $localizador, idMotoBoy: $idMotoBoy, idEstabelecimento: $idEstabelecimento, custoEntrega: $custoEntrega, custoCliente: $custoCliente, cep: $cep, rua: $rua, nmr: $nmr, deliveryLocation: $deliveryLocation, ultimaLocMotoboy: $ultimaLocMotoboy, dthrCreated: $dthrCreated, dthrAccepted: $dthrAccepted, dthrDelivered: $dthrDelivered, dthrProblem: $dthrProblem, dthrCanceled: $dthrCanceled, observation: $observation)';
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
        other.deliveryLocation == deliveryLocation &&
        other.ultimaLocMotoboy == ultimaLocMotoboy &&
        other.dthrCreated == dthrCreated &&
        other.dthrAccepted == dthrAccepted &&
        other.dthrDelivered == dthrDelivered &&
        other.dthrProblem == dthrProblem &&
        other.dthrCanceled == dthrCanceled &&
        other.observation == observation;
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
        deliveryLocation.hashCode ^
        ultimaLocMotoboy.hashCode ^
        dthrCreated.hashCode ^
        dthrAccepted.hashCode ^
        dthrDelivered.hashCode ^
        dthrProblem.hashCode ^
        dthrCanceled.hashCode ^
        observation.hashCode;
  }
}
