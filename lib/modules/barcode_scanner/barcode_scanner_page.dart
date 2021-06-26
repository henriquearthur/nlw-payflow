import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/shared/components/set_label_buttons/set_label_icon_buttons_component.dart';
import 'package:payflow/shared/components/bottom_sheet_component.dart';
import 'package:payflow/shared/services/navigator_service.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BarcodeScannerPage extends StatefulWidget {
  BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    controller.getAvailableCameras();
    _disposers.add(
      reaction(
        (_) => controller.status.hasBarcode,
        (_) => goToInsertTicketPage(),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  goToInsertTicketPage() => GetIt.I
      .get<NavigatorService>()
      .currentState!
      .pushReplacementNamed('/insert-ticket',
          arguments: controller.status.barcode);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Observer(
            builder: (_) {
              if (controller.status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text(
                  "Escaneie o código de barras do boleto",
                  style: AppTextStyles.buttonBackground,
                ),
                centerTitle: true,
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SetLabelIconButtonsComponent(
                primaryLabel: "Inserir código do boleto",
                primaryOnPressed: goToInsertTicketPage,
                icon: Icon(Icons.image),
                iconOnPressed: controller.scanWithImagePicker,
              ),
            ),
          ),
          Observer(
            builder: (_) {
              if (controller.status.hasError) {
                return Material(
                  child: BottomSheetComponent(
                    title: 'Não foi possível identificar um código de barras.',
                    subtitle:
                        'Tente escanear novamente ou digite o código do seu boleto.',
                    primaryLabel: 'Escanear novamente',
                    primaryOnPressed: controller.scanWithCamera,
                    secondaryLabel: 'Digite o código',
                    secondaryOnPressed: () {},
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
