import 'package:bmitracker/features/bmi_calculator/data/datasource/bmi_data_source.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/loading.dart';
import '../../data/model/BMI.dart';

class BmiResultScreen extends StatefulWidget {
  final Bmi bmiModel;
  final bool? isUpdate;


  const BmiResultScreen({Key? key, required this.bmiModel, this.isUpdate}) : super(key: key);

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen> {
  @override
  Widget build(BuildContext context) {
    String bmiStatus = getBmiStatus(widget.bmiModel.bmi!);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'BMI Result',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  'Weight: ${widget.bmiModel.weight} kg',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Height: ${widget.bmiModel.height} cm',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Age: ${widget.bmiModel.age}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'BMI: ${widget.bmiModel.bmi?.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Status: $bmiStatus',
                  style: TextStyle(
                    fontSize: 18,
                    color: _getStatusColor(bmiStatus),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Go Back'),
                    ),
                    ElevatedButton(
                      onPressed: saveToFirestore,
                      child: Text('${widget.isUpdate == true ? 'Update' : 'Save'} BMI'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveToFirestore() async {
    showLoadingDialog(context);
    await BmiDataSource.AddBmiToFirebase(widget.bmiModel);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('saved successfully'),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.of(context).pop();
  }
  String getBmiStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Underweight':
        return Colors.blue;
      case 'Normal':
        return Colors.green;
      case 'Overweight':
        return Colors.orange;
      case 'Obese':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
