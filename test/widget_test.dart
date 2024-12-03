import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:me_and_allah/main.dart';
import 'package:me_and_allah/pages/tasbih_digital_page.dart';
import 'package:me_and_allah/pages/doa_page.dart';
import 'package:me_and_allah/pages/to_do_list_page.dart';

void main() {
  testWidgets('Home Page has three buttons', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MeAndAllahApp());

    // Verify that our home page has three buttons.
    expect(find.byType(ElevatedButton), findsNWidgets(3));
  });

  testWidgets('TasbihDigitalPage increments count when button is tapped', (WidgetTester tester) async {
    // Build the TasbihDigitalPage.
    await tester.pumpWidget(MaterialApp(home: TasbihDigitalPage()));

    // Verify initial count is 0.
    expect(find.text('Subhanallah'), findsOneWidget); // Pastikan teks yang dicari sesuai

    // Tap the button and trigger a frame.
    await tester.tap(find.byType(ElevatedButton).first); // Pastikan Anda menargetkan button yang tepat
    await tester.pump(); // Rebuild the widget after the state has changed.

    // Verify that the count has incremented to 1.
    expect(find.text('1'), findsOneWidget); // Ganti dengan teks yang sesuai untuk count

    // Tap the button until count reaches 33
    for (int i = 0; i < 32; i++) {
      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pump();
    }

    // Verify that the count displays the next tasbih message
    expect(find.text('Alhamdulillah'), findsOneWidget); // Ganti dengan pesan yang sesuai
  });

  testWidgets('DoaPage displays correct text', (WidgetTester tester) async {
    // Build the DoaPage.
    await tester.pumpWidget(MaterialApp(home: DoaPage()));

    // Verify that the DoaPage shows the correct text.
    expect(find.text('This is the Doa Page'), findsOneWidget); // Ganti teks sesuai yang ditampilkan
  });

  testWidgets('ToDoListPage displays correct text', (WidgetTester tester) async {
    // Build the ToDoListPage.
    await tester.pumpWidget(MaterialApp(home: ToDoListPage()));

    // Verify that the ToDoListPage shows the correct text.
    expect(find.text('Sholat Subuh'), findsOneWidget); // Ganti teks sesuai yang ditampilkan
  });
}
