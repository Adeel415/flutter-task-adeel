
import 'package:stacked_services/stacked_services.dart';
import '../ui/bottom_sheets/notice/cart_sheet.dart';
import 'app.locator.dart';

enum BottomSheetType {
  cart,
}

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();
  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.cart: (context, request, completer) =>
        CartSheet(),
  };
  bottomSheetService.setCustomSheetBuilders(builders);
}