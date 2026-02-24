import '../models/bundle.dart';
import '../models/plan.dart';

class DataService {
  List<Bundle> getBundlesForTurkey() {
    return const [
      Bundle(id: 'b1', dataGB: 3, validDays: 30, priceUSD: 2.99),
      Bundle(id: 'b2', dataGB: 5, validDays: 7, priceUSD: 3.50),
      Bundle(id: 'b3', dataGB: 5, validDays: 15, priceUSD: 3.99),
      Bundle(id: 'b4', dataGB: 5, validDays: 30, priceUSD: 4.25),
      Bundle(id: 'b5', dataGB: 10, validDays: 10, priceUSD: 5.50),
      Bundle(id: 'b6', dataGB: 10, validDays: 15, priceUSD: 5.75),
      Bundle(id: 'b7', dataGB: 20, validDays: 30, priceUSD: 7.48),
      Bundle(id: 'b8', dataGB: 0, validDays: 10, priceUSD: 5.50, isUnlimited: true),
    ];
  }

  List<Plan> getRegionalPlansForTurkey() {
    return const [
      Plan(
        id: 'p1',
        name: 'EuroConnect',
        dataLabel: '1 GB',
        validLabel: '7 days',
        supportedCountries: 32,
        priceUSD: 2.51,
      ),
      Plan(
        id: 'p2',
        name: 'Global Unlimited',
        dataLabel: 'Unlimited',
        validLabel: '1 day',
        supportedCountries: 34,
        priceUSD: 2.99,
      ),
      Plan(
        id: 'p3',
        name: 'EuroLink',
        dataLabel: '1 GB',
        validLabel: '1 day',
        supportedCountries: 34,
        priceUSD: 2.52,
      ),
      Plan(
        id: 'p4',
        name: 'worldisyours',
        dataLabel: '1 GB',
        validLabel: '1 day',
        supportedCountries: 57,
        priceUSD: 3.00,
      ),
    ];
  }
}