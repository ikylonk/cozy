import 'package:bwa_cozy/pages/splash_page.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //! mengebalikan provider pada seluruh kelas main atau  seluruh page yang ada di dalamnya
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()),
    );
  }
}