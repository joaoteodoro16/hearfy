import 'package:get/get.dart';
import 'package:hear_fy/app/modules/track/track_bindings.dart';
import 'package:hear_fy/app/modules/track/track_page.dart';

class TrackRouters {
  TrackRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/tracks/',
      page: () => const TrackPage(),
      binding: TrackBindings()
    )
  ];
}
