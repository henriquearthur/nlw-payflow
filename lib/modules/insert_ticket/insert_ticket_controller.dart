import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:payflow/shared/models/ticket.dart';
import 'package:payflow/shared/services/navigator_service.dart';
import 'package:payflow/shared/tickets/tickets_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertTicketController {
  final formKey = GlobalKey<FormState>();
  Ticket ticket = Ticket();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  String? validateDueDate(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;

  String? validateMoney(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;

  String? validateBarcode(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChanged({
    String? name,
    String? dueDate,
    double? money,
    String? barcode,
  }) {
    ticket = ticket.copyWith(
      name: name,
      dueDate: dueDate,
      money: money,
      barcode: barcode,
    );
  }

  Future<void> addTicket() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      await saveTicket();
      GetIt.I.get<TicketsController>().getTickets();
      GetIt.I.get<NavigatorService>().currentState!.pop();
    }
  }

  Future<void> saveTicket() async {
    final instance = await SharedPreferences.getInstance();
    final tickets = instance.getStringList("tickets") ?? [];
    tickets.add(ticket.toJson());

    await instance.setStringList("tickets", tickets);
    return;
  }
}
