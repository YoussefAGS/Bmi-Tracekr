import 'package:bmitracker/core/extensions/context_extension.dart';
import 'package:bmitracker/core/routes/app_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/animations/animate_do.dart';
import '../../../../../core/common/widgets/custom_text_field.dart';
import '../../../data/model/BMI.dart';
import 'bmi_calc_button.dart';

class BmiClaculatorTextForm extends StatefulWidget {
  final Bmi? bmi;

  const BmiClaculatorTextForm({Key? key, this.bmi}) : super(key: key);

  @override
  State<BmiClaculatorTextForm> createState() => _BmiClaculatorFormState();
}

class _BmiClaculatorFormState extends State<BmiClaculatorTextForm> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late TextEditingController weightController;
  late TextEditingController heightController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    if(widget.bmi!=null){
    weightController = TextEditingController(text: widget.bmi.toString());
    heightController = TextEditingController(text: widget.bmi.toString());
    ageController = TextEditingController(text: widget.bmi.toString());}
    else{
      weightController = TextEditingController();
      heightController = TextEditingController();
      ageController = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Column(
          children: [
            CustomFadeInRight(
              duration: 200,
              child: CustomTextField(
                controller: ageController,
                hintText: "Your age",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your age";
                  }
                  double? age = double.tryParse(value);
                  if (age! <= 0) {
                    return "Please enter a valid age";
                  }
                  if (age > 200) {
                    return "Age cannot be greater than 200";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CustomFadeInRight(
                duration: 200,
                child: CustomTextField(
                  controller: weightController,
                  hintText: "Your weight in kg",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your weight";
                    }
                    double? weight = double.tryParse(value);
                    if (weight! <= 0) {
                      return "Please enter a valid weight";
                    }
                    if (weight > 200) {
                      return "weight cannot be greater than 200";
                    }
                    return null;
                  },
                )),
            SizedBox(
              height: 25,
            ),
            CustomFadeInRight(
                duration: 200,
                child: CustomTextField(
                  controller: heightController,
                  hintText: "Your height  in cm",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your height";
                    }
                    double? height = double.tryParse(value);
                    if (height! <= 0) {
                      return "Please enter a valid height";
                    }
                    if (height > 220) {
                      return "height cannot be greater than 220";
                    }
                    return null;
                  },
                )),
            const SizedBox(height: 40),
            CalculatorButton(onPressed: ValidatFoem)
          ],
        ));
  }

  void ValidatFoem() async {
    if (formkey.currentState!.validate()) {
      double bmi = double.parse(weightController.text) /
          ((double.parse(heightController.text) / 100) *
              (double.parse(heightController.text) / 100));
      Bmi bmiModel = Bmi(
          weight: double.parse(weightController.text),
          height: double.parse(heightController.text),
          age: int.parse(ageController.text),
          userId: FirebaseAuth.instance.currentUser!.uid,
          timestamp: DateTime.now(),
          bmi: bmi);
      context.pushName(AppRoute.bmiResult, arguments: bmiModel);
    }
  }
}
