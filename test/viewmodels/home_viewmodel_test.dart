import 'package:flutter_task_adeel/ui/views/main/main_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeViewModel', () {
    late MainViewmodel model;

    setUp(() {
      model = MainViewmodel();
    });

    test('should be initialized correctly', () {
      expect(model, isNotNull);
    });

    // Add more tests as you build features
  });
}
