import 'package:bmitracker/core/extensions/context_extension.dart';
import 'package:bmitracker/core/routes/app_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../refactor/recent_body.dart';

class RecentBmi extends StatefulWidget {
  const RecentBmi({super.key});
  @override
  State<RecentBmi> createState() => _RecentBmiState();
}
class _RecentBmiState extends State<RecentBmi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent BMI"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: context.color.bluePinkDark,
        actions: [
          IconButton(onPressed: () {
            FirebaseAuth.instance.signOut();
            context.pushName(AppRoute.login);
          }, icon: const Icon(Icons.logout, color: Colors.white,)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushName(AppRoute.Calculator);
        },
        child: const Icon(Icons.add),
      ),
      body: RecentBody(),
    );
  }
}
