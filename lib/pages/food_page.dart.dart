import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventario_2/controller/crud_controller.dart';
import 'package:inventario_2/controller/login_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventario_2/models/articulo.dart';

class FoodPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  final controller2 = Get.put(CrudController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CrudController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Food Network'),
          actions: <Widget>[
            Builder(builder: (BuildContext context) {
              return
                  // TextButton(
                  //   onPressed: () async {
                  //     controller.signOut();
                  //   },
                  //   child: const Text('Sign out',style: TextStyle(color: Theme.of(context).buttonColor),),

                  // );

                  Row(
                    children: [
                      FlatButton(
                child: const Text('Sign out'),
                textColor: Theme.of(context).buttonColor,
                onPressed: () async {
                      controller.signOut();
                },
              ),
                      // Boton para añadir mas articulos
                      FlatButton(
                        child: const Text('ADD'),
                        textColor: Theme.of(context).buttonColor,
                        onPressed: () async {
                         _.moviesRef.add(_.anadirArticulo);
                        },
                      ),
                    ],
                  );
            })
          ],
        ),
   /*   body: Center(
          child: Text('Food page',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black)),
        ),*/
          // Widget para traer los datos de firebase
        body: StreamBuilder<QuerySnapshot<Articulo>>(
          stream: _.moviesRef.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final data = snapshot.requireData;

            return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return _ArticuloItem(
                  data.docs[index].data(),
                  data.docs[index].reference,
                  _
                );
              },
            );
          },
        )
      ),
    );
  }
}

class _ArticuloItem extends StatelessWidget {
  _ArticuloItem(this.articulo, this.reference,this._);

  final Articulo articulo;
  final DocumentReference<Articulo> reference;
  final _;

  /// return info
  Widget get details {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8,bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              descripcion,
              observaciones,
              modeloSerie,
              fechaAltaAdquisicion,
              id_marca_persona_valor,
            ],
          ),
          Column(
            children: [
              // Boton para editar la foto desde la camara
              IconButton(onPressed: ()async{
              _.updateData(ImageSource.camera,reference);
              }, icon: Icon(Icons.camera)),

              // Boton para editar la foto desde la galeria
              IconButton(onPressed: ()async{
               _.updateData(ImageSource.gallery,reference);
              }, icon: Icon(Icons.image)),

              // Boton para editar los datos
              IconButton(onPressed: ()async{
                _.updateArticulo(reference,articulo.foto);
              }, icon: Icon(Icons.edit)),

              // Boton para borrar una coleccion (tabla)
              IconButton(onPressed: (){
               _.delete(reference);
              }, icon: Icon(Icons.delete)),

            ],
          )
        ],
      ),
    );
  }

  /// Returns fotos articulo
  Widget get foto {
    return SizedBox(
      width: 100,
      child: Center(
        child: Image.network(articulo.foto),
      ),
    );
  }

  /// return descripcion
  Widget get descripcion {
    return Text(
      '${articulo.descripcion}',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  //return Observaciones
  Widget get observaciones {
    return Text(
      '${articulo.observaciones}',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  // returns FechaAlta, FechaAdquisicion
  Widget get fechaAltaAdquisicion {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text('FechaAlta: ${articulo.fechaAlta.day}/${articulo.fechaAlta.month}/${articulo.fechaAlta.year}'),
          ),
          Text('FechaAdquisicion: ${articulo.fechaAdquisicion.day}/${articulo.fechaAdquisicion.month}/${articulo.fechaAdquisicion.year}'),
        ],
      ),
    );
  }

  /// Returns Modelo, Serie
  Widget get modeloSerie {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text('Modelo: ${articulo.modelo}'),
          ),
          Text('Serie: ${articulo.serie}'),
        ],
      ),
    );
  }

  // Returns id_marca, id_persona, valor
  Widget get id_marca_persona_valor {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text('ID_Marca: ${articulo.id_marca}'),
          ),
          Text('ID_Persona: ${articulo.id_persona}'),
          Text('Valor: ${articulo.valor}'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      child: Row(
        children: [
          foto,
          Flexible(child: details),
        ],
      ),
    );
  }
}
