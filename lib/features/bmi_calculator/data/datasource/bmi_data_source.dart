import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/BMI.dart';
import 'firbase_utils.dart';


class BmiDataSource {

  static Future<void> AddBmiToFirebase(Bmi bmi) {
    return BmiDatabaseUtils.addBmiToFirebase(bmi);
  }
  static getBmiCollectionsQurery() {
    return BmiDatabaseUtils.getBmiCollectionsQurery();
  }
  static  updateBmiInFirebase(Bmi bmi) {
    return BmiDatabaseUtils.updateBmiInFirebase(bmi);
  }
  static deleteBmi(Bmi bmi) {
    return BmiDatabaseUtils.deleteBmi(bmi);
  }

}
