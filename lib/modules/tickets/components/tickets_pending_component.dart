import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/tickets/tickets_controller.dart';

class TicketsPendingComponent extends StatelessWidget {
  final ticketsController = GetIt.I.get<TicketsController>();

  TicketsPendingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56,
              height: 34,
            ),
            Container(
              width: 1,
              height: 32,
              color: AppColors.background.withOpacity(0.3),
            ),
            Observer(
              builder: (_) {
                return Text.rich(
                  TextSpan(
                    text: "Você tem ",
                    style: AppTextStyles.captionBackground,
                    children: [
                      TextSpan(
                        text: "${ticketsController.pendingTickets} boletos\n",
                        style: AppTextStyles.captionBoldBackground,
                      ),
                      TextSpan(
                        text: "cadastrados para pagar",
                        style: AppTextStyles.captionBackground,
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
