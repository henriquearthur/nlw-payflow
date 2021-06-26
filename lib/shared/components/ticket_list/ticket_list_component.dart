import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:payflow/shared/components/default_tab_loading/default_tab_loading_component.dart';
import 'package:payflow/shared/components/ticket_tile/ticket_tile_component.dart';
import 'package:payflow/shared/tickets/tickets_controller.dart';

class TicketListComponent extends StatelessWidget {
  final ticketsController = GetIt.I.get<TicketsController>();

  TicketListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (ticketsController.tickets == null) {
          return Center(
            child: DefaultTabLoadingComponent(),
          );
        } else {
          return ListView.builder(
            itemCount: ticketsController.tickets!.length,
            itemBuilder: (_, index) =>
                TicketTileComponent(ticket: ticketsController.tickets![index]),
          );
        }
      },
    );
  }
}
