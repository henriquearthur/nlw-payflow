import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/components/user_header/user_header_component.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class HomePage extends StatelessWidget {
  final homeController = HomeController();
  final authController = GetIt.I.get<AuthController>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: UserHeaderComponent(
        user: authController.user,
        height: 184
      ),
      body: Observer(
        builder: (_) => IndexedStack(
          index: homeController.currentPage,
          children: homeController.pages
              .map<Widget>(
                  (page) => page.isLoaded ? page.page() : page.loading())
              .toList(),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: Observer(
          builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  color: homeController.currentPage == 0
                      ? AppColors.primary
                      : AppColors.body,
                  onPressed: () =>
                      homeController.changePage(homeController.pages[0]),
                ),
                InkWell(
                  onTap: homeController.openBarcodeScanner,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primary,
                    ),
                    child: Icon(Icons.add_box_outlined,
                        color: AppColors.background),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.description_outlined),
                  color: homeController.currentPage == 1
                      ? AppColors.primary
                      : AppColors.body,
                  onPressed: () =>
                      homeController.changePage(homeController.pages[1]),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
