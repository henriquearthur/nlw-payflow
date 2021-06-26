import 'package:payflow/shared/components/default_tab_loading/default_tab_loading_component.dart';

class AppPage {
  Function loading = () => DefaultTabLoadingComponent();
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
