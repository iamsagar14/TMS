import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tms/app/modules/home/views/home_view.dart';
import 'package:tms/widgets/decorated_textfield.dart';
import 'package:tms/widgets/image_small_card.dart';
import 'package:tms/widgets/reusable_card.dart';

void main() {
  testWidgets('HomeView Test', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(home: HomeView()));
    expect(find.text('GOGO'), findsOneWidget);
    expect(find.byType(DecoratedTextField), findsOneWidget);
    expect(find.text('Category'), findsOne);
    expect(find.byType(CategoryCard), findsExactly(10));
    expect(find.text('Popular'), findsOneWidget);
    expect(find.byType(ImageSmallCard), findsExactly(10));
    ;
  });
}
