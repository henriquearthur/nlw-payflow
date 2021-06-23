import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/components/user_header.dart';
import 'package:payflow/shared/models/user.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class HomePage extends StatelessWidget {
  final homeController = HomeController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Criar efeito gradiente entre o conteúdo da tela e a BottomNavigationBar

    return Scaffold(
      appBar: UserHeader(
        user: User(name: "Henrique", email: "hnrq.art"),
        height: 184,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: AppColors.primary,
              onPressed: () =>
                  homeController.changePage(homeController.pages[0]),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primary,
                ),
                child:
                    Icon(Icons.add_box_outlined, color: AppColors.background),
              ),
            ),
            IconButton(
              icon: Icon(Icons.description_outlined),
              color: AppColors.body,
              onPressed: () =>
                  homeController.changePage(homeController.pages[1]),
            )
          ],
        ),
      ),
    );
  }
}
