import 'package:flutter/material.dart';
import 'package:payflow/shared/components/ticket_list/ticket_list_component.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class ExtractPage extends StatelessWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Meu extrato",
                  style: AppTextStyles.titleBoldHeading,
                ),
                Text(
                  "TODO pagos",
                  style: AppTextStyles.captionBody,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.stroke,
            thickness: 1,
            height: 1,
          ),
          Expanded(
            child: TicketListComponent(),
          ),
        ],
      ),
    );
  }
}
