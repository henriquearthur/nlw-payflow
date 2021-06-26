import 'package:flutter/material.dart';
import 'package:payflow/shared/models/ticket.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class TicketTileComponent extends StatelessWidget {
  final Ticket ticket;

  TicketTileComponent({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        ticket.name ?? 'Boleto sem nome',
        style: AppTextStyles.titleListTile,
      ),
      subtitle: Text(
        "Vence em ${ticket.dueDate}",
        style: AppTextStyles.captionBody,
      ),
      trailing: Text.rich(
        TextSpan(
          text: "R\$ ",
          style: AppTextStyles.trailingRegular,
          children: [
            TextSpan(
              text: ticket.money!.toStringAsFixed(2),
              style: AppTextStyles.trailingBold,
            )
          ],
        ),
      ),
    );
  }
}
