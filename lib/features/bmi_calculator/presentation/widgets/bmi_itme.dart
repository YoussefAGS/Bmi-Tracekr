import 'package:bmitracker/core/extensions/context_extension.dart';
import 'package:bmitracker/features/bmi_calculator/data/datasource/bmi_data_source.dart';
import 'package:bmitracker/features/bmi_calculator/data/model/BMI.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/animations/animate_do.dart';
import '../../../../core/routes/app_route.dart';

class BmiListItem extends StatelessWidget {
  final Bmi bmi;
  final Function()? onTap;

  const BmiListItem({Key? key, required this.bmi, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            title: Text('BMI: ${bmi.bmi}'), // Display BMI with 2 decimal places
            subtitle: Text('Weight: ${bmi.weight} kg, Height: ${bmi.height} cm'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    BmiDataSource.deleteBmi(bmi);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    context.pushName(AppRoute.bmiUpdate, arguments: bmi);
                    print(bmi.height);
                    print("ffffffffffffffffffffffffffffffffffffffff");

                  },
                ),
              ],
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}