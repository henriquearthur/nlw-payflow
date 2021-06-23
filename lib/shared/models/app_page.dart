import 'package:payflow/shared/components/default_tab_loading.dart';

class AppPage {
  Function loading = () => DefaultTabLoading();
  Function page;
  bool isLoaded = false;

  AppPage({
    Function? loading,
    required this.page,
  }) {
    if (loading != null) {
      this.loading = loading;
    }
  }
}
