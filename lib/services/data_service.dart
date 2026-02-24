import 'package:stacked/stacked.dart';
import 'package:flutter_task_adeel/models/bundle.dart';
import 'package:flutter_task_adeel/models/plan.dart';

class DataService {
  static const List<Map<String, dynamic>> _bundles = [
    {'name': '3 GB', 'data': '3 GB', 'validity': 30, 'price': 2.99, 'type': 'standard'},
    {'name': '5 GB', 'data': '5 GB', 'validity': 30, 'price': 3.50, 'type': 'standard'},
    {'name': '10 GB', 'data': '10 GB', 'validity': 30, 'price': 4.25, 'type': 'standard'},
    {'name': '20 GB', 'data': '20 GB', 'validity': 30, 'price': 5.50, 'type': 'standard'},
  ];

  static const List<Map<String, dynamic>> _regionalPlans = [
    {'name': 'EuroConnect', 'data': '1 GB', 'validity': 7, 'price': 2.51},
    {'name': 'Worldlyours', 'data': '1 GB', 'validity': 7, 'price': 2.52},
  ];

  List<Bundle> getBundles() {
    return _bundles.map((b) => Bundle(
      name: b['name'],
      data: b['data'],
      validity: '${b['validity']} days',
      price: b['price'],
      type: b['type'],
    )).toList();
  }

  List<Plan> getRegionalPlans() {
    return _regionalPlans.map((p) => Plan(
      name: p['name'],
      data: p['data'],
      validity: '${p['validity']} days',
      price: p['price'],
    )).toList();
  }
}