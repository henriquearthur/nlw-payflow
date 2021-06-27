import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:payflow/modules/insert_ticket/insert_ticket_controller.dart';
import 'package:payflow/shared/components/input_text/input_text_component.dart';
import 'package:payflow/shared/components/set_label_buttons/set_label_buttons_component.dart';
import 'package:payflow/shared/services/navigator_service.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class InsertTicketPage extends StatefulWidget {
  final String? barcode;

  InsertTicketPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertTicketPageState createState() => _InsertTicketPageState();
}

class _InsertTicketPageState extends State<InsertTicketPage> {
  final InsertTicketController controller = InsertTicketController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );

  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 69, vertical: 24),
                child: Text(
                  "Preencha os dados do boleto",
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputTextComponent(
                      label: "Nome do boleto",
                      icon: Icons.description_outlined,
                      validator: controller.validateName,
                      onChanged: (value) => controller.onChanged(name: value),
                    ),
                    InputTextComponent(
                      label: "Vencimento",
                      icon: FontAwesomeIcons.timesCircle,
                      validator: controller.validateDueDate,
                      controller: dueDateInputTextController,
                      onChanged: (value) =>
                          controller.onChanged(dueDate: value),
                    ),
                    InputTextComponent(
                      label: "Valor",
                      icon: FontAwesomeIcons.wallet,
                      validator: (_) => controller
                          .validateMoney(moneyInputTextController.numberValue),
                      controller: moneyInputTextController,
                      onChanged: (value) => controller.onChanged(
                          money: moneyInputTextController.numberValue),
                    ),
                    InputTextComponent(
                      label: "Código",
                      icon: FontAwesomeIcons.barcode,
                      validator: controller.validateBarcode,
                      controller: barcodeInputTextController,
                      onChanged: (value) =>
                          controller.onChanged(barcode: value),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtonsComponent(
        primaryLabel: "Cancelar",
        primaryOnPressed: GetIt.I.get<NavigatorService>().currentState!.pop,
        secondaryLabel: "Cadastrar",
        enableSecondaryColor: true,
        secondaryOnPressed: controller.addTicket,
      ),
    );
  }
}
