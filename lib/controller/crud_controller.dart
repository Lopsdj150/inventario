import 'dart:io';

import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventario_2/models/articulo.dart';
import 'package:image_picker/image_picker.dart';

class CrudController extends GetxController{

  // Query para traer datos de la coleccion Articulo en firebase
  final moviesRef = FirebaseFirestore.instance
      .collection('articulo')
      .withConverter<Articulo>(
    fromFirestore: (snapshots, _) => Articulo.fromJson(snapshots.data()!),
    toFirestore: (articulo, _) => articulo.toJson(),
  );

  Articulo anadirArticulo =  Articulo(noSep: 2,
      foto: "as",
      descripcion: "Descripcion default",
      modelo: "Modelo default",
      serie: "default", valor: 1.2,
      fechaAlta: DateTime.now(),
      fechaAdquisicion: DateTime.now(),
      observaciones: "Observacion default",
      id_marca: 55,
      id_persona: 88);



  // update document (Datos de la tabla)
  void updateArticulo(DocumentReference<Articulo> reference,String foto)async{

    Articulo editarArticulo =  Articulo(noSep: 858,
        foto: foto,
        descripcion: "Descripcion simple",
        modelo: "Modelo 32s",
        serie: "ABC-123", valor: 2.3,
        fechaAlta: DateTime.now(),
        fechaAdquisicion: DateTime.now(),
        observaciones: "Observacion LIMPIA",
        id_marca: 555,
        id_persona: 888);

    await FirebaseFirestore.instance
        .runTransaction((transaction) async {
      transaction.update(reference, editarArticulo.toJson());
    });
  }

  // Delete document
  void delete(DocumentReference<Articulo> reference)async{
    await FirebaseFirestore.instance.runTransaction((transaction) async{
      transaction.delete(reference);
    });
  }

  // update Data (Actualiza la foto de la tabla)

  void updateData(ImageSource source,DocumentReference<Articulo> reference)async{
    XFile? file = await getImage(source);

    if(file != null){
      String url = await getDownloadPhoto(file);
      await FirebaseFirestore.instance.runTransaction((transaction) async => transaction.update(reference, {
        "foto" : url,
      }));
    }

  }

  // upload Foto and get Download url

  Future<String> getDownloadPhoto(XFile file)async{
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('articulos')
        .child('/articulo${DateTime.now().millisecondsSinceEpoch}.jpg');
    final UploadTask uploadTask = ref.putFile(File(file.path));
    await uploadTask.whenComplete(() {});
    final String url = await ref.getDownloadURL();
    return url;
  }



  // getImage

  Future<XFile?> getImage(ImageSource source)async{
    XFile? pickedFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 35,
    );
    return pickedFile;
  }

}
