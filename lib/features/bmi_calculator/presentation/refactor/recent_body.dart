
import 'package:bmitracker/features/bmi_calculator/data/datasource/bmi_data_source.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/model/BMI.dart';
import '../widgets/bmi_itme.dart';

class RecentBody extends StatelessWidget {
   RecentBody({super.key});
  final jobsQuery = BmiDataSource.getBmiCollectionsQurery();
  @override
  Widget build(BuildContext context) {
    return FirestoreListView<Bmi>(
      query: jobsQuery,
      pageSize: 10,
      emptyBuilder: (context) => const Text('No data'),
      errorBuilder: (context, error, stackTrace) => Text(error.toString()),
      loadingBuilder: (context) => const CircularProgressIndicator(),
      itemBuilder: (context, doc) {
        final bmi = doc.data();
        return BmiListItem(bmi: bmi, onTap: () {});
      },
    );
  }
}
