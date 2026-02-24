import 'package:flutter_task_adeel/ui/views/main/main_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeViewModel', () {
    late MainViewModel model;

    setUp(() {
      model = MainViewModel();
    });

    test('should be initialized correctly', () {
      expect(model, isNotNull);
    });

    // Add more tests as you build features
  });
}
