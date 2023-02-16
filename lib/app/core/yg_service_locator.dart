import 'package:get_it/get_it.dart';

import 'yg_router.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  // Router
  // --------------------
  sl.registerSingleton(YgRouter());
}
