import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/tickets/tickets_page.dart';
import 'package:payflow/shared/models/app_page.dart';
import 'package:payflow/shared/services/navigator_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  List<AppPage> pages = [
    AppPage(page: () => TicketsPage()),
    AppPage(page: () => ExtractPage()),
  ];

  @observable
  int currentPage = 0;

  _HomeControllerBase() {
    changePage(pages.first);
  }

  @action
  void changePage(AppPage newPage) {
    pages.firstWhere((element) => element == newPage).isLoaded = true;
    currentPage = pages.indexOf(newPage);
  }

  void openBarcodeScanner() => GetIt.I
      .get<NavigatorService>()
      .currentState!
      .pushNamed('/barcode-scanner');
}
