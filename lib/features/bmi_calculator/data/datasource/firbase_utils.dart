import 'package:bmitracker/features/bmi_calculator/data/model/BMI.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../../auth/data/my_provider.dart';

class BmiDatabaseUtils {
  static CollectionReference<Bmi> getBmiCollection() {
    return FirebaseFirestore.instance.collection("Bmi").withConverter<Bmi>(
        fromFirestore: (snapshot, option) => Bmi.fromJson(snapshot.data()!),
        toFirestore: (value, option) => value.toJson());
  }

  static Query<Bmi> getBmiCollectionsQurery() {
    return FirebaseFirestore.instance
        .collection("Bmi")
        .withConverter<Bmi>(
          fromFirestore: (snapshot, option) => Bmi.fromJson(snapshot.data()!),
          toFirestore: (value, option) => value.toJson(),
        )
        .orderBy('timestamp', descending: true); // Order by timestamp in descending order
  }


  static Future<void> addBmiToFirebase(Bmi bmi) {
    var collection = getBmiCollection();
    var docref = collection.doc();
    bmi.id = docref.id;
    return docref.set(bmi);
  }

  static Future<void> updateBmiInFirebase(Bmi bmi) {
    return getBmiCollection().doc(bmi.id).update(bmi.toJson());
  }

  static Future<void> deleteBmi(Bmi bmi) {
    return getBmiCollection().doc(bmi.id).delete();
  }
}
