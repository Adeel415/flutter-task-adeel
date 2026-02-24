import 'package:flutter_task_adeel/ui/views/home/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeViewModel', () {
    late HomeViewModel model;

    setUp(() {
      model = HomeViewModel();
    });

    test('should be initialized correctly', () {
      expect(model, isNotNull);
    });

    // Add more tests as you build features
  });
}
