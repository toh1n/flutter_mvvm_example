import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/utils/routes/routes.dart';
import 'package:flutter_mvvm_example/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_example/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),

      ],
      builder: (context, child) {
        return const MaterialApp(
          initialRoute: RoutesName.login,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
