import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@immutable
class Articulo {
  Articulo({
    required this.noSep,
    required this.descripcion,
    required this.modelo,
    required this.serie,
    required this.valor,
    required this.fechaAlta,
    required this.fechaAdquisicion,
    required this.observaciones,
    required this.id_marca,
    required this.id_persona,
    required this.foto,
  });

  Articulo.fromJson(Map<String, Object?> json)
      : this(
    noSep: json['noSep']! as int,
    descripcion: json['descripcion']! as String,
    modelo: json['modelo']! as String,
    serie: json['serie']! as String,
    valor: double.parse(json['valor']!.toString()),
    fechaAlta: (json['fechaAlta']! as Timestamp).toDate(),
    fechaAdquisicion: (json['fechaAdquisicion']! as Timestamp).toDate(),
    observaciones: json['observaciones']! as String,
    id_marca: json['id_marca']! as int,
    id_persona: json['id_persona']! as int,
    foto: json['foto']! as String,
  );

  final int noSep;
  final String descripcion;
  final String modelo;
  final String serie;
  final double valor;
  final DateTime fechaAlta;
  final DateTime fechaAdquisicion;
  final String observaciones;
  final int id_marca;
  final int id_persona;
  final String foto;

  Map<String, Object?> toJson() {
    return {
      'noSep': noSep,
      'descripcion': descripcion,
      'modelo': modelo,
      'serie': serie,
      'valor': valor,
      'fechaAlta': fechaAlta,
      'fechaAdquisicion': fechaAdquisicion,
      'observaciones': observaciones,
      'id_marca': id_marca,
      'id_persona': id_persona,
      'foto': foto,
    };
  }
}