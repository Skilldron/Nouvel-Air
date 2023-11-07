import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/routes/routes.dart';


class NouvelAir extends StatelessWidget {
  const NouvelAir({super.key});

  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nouvel Air',
      initialRoute: '/',
      unknownRoute: GetPage(name: '/notfound', page: () => const Text('Not found')),
      getPages: routes,
      home: const CircularProgressIndicator(),
    );
  }
}