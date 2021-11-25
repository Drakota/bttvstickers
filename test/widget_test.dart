import 'package:bttvstickers/main.dart';
import 'package:bttvstickers/models/pack.dart';
import 'package:bttvstickers/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Main page loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Settings()),
          ChangeNotifierProvider(create: (context) => Pack()),
        ],
        child: Builder(
          builder: (_) => const App(),
        ),
      ),
    );
  });
}
