import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taalim/src/data/firebase/firebase_collection.dart';
import 'package:taalim/src/data/model/dua_model.dart';

class DuaRepo {
  final CollectionReference dualarCollection =
      FirebaseFirestore.instance.collection(FirebaseCollection.dualar);

  Future<List<DuaModel>> fetchDua() async {
    QuerySnapshot querySnapshot = await dualarCollection.get();
    return querySnapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return DuaModel.fromMap(data);
    }).toList();
  }

  Future<List<DuaModel>> fetchDuaSelection(String parentKey) async {
    QuerySnapshot querySnapshot = await dualarCollection
        .doc(parentKey)
        .collection(FirebaseCollection.duaSelection)
        .get();
    return querySnapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return DuaModel.fromMap(data);
    }).toList();
  }
}
