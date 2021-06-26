import 'package:mobx/mobx.dart';
import 'package:payflow/shared/models/ticket.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'tickets_controller.g.dart';

class TicketsController = _TicketsControllerBase with _$TicketsController;

abstract class _TicketsControllerBase with Store {
  @observable
  List<Ticket>? tickets;

  @computed
  int get pendingTickets => tickets == null ? 0 : tickets!.length;

  _TicketsControllerBase() {
    getTickets();
  }

  @action
  Future<void> getTickets() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("tickets") ?? <String>[];

      tickets = response.map((e) => Ticket.fromJson(e)).toList();
    } catch (e) {
      tickets = <Ticket>[];
      print(e);
    }
  }
}
