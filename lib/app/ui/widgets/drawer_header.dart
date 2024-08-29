import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String perfil = box.read("perfil");
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: GlobalColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Image.asset(
            'assets/images/campesino_login.png',
            width: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            perfil,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}
