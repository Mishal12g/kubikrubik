import 'package:flutter/material.dart';
import 'package:kubikrubik/resources/colors_app.dart';
import 'package:kubikrubik/resources/resources.dart';
import 'package:kubikrubik/ui/components/background_image_widget.dart';
import 'package:kubikrubik/ui/components/container_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      appBar: AppBar(
        title: const Text("Настройки"),
      ),
      body: Stack(
        children: [
          const BackgroundImageWidget(),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(height: 60),
                  _SettingTileWidget(
                    text: "Политика конфиденциальности",
                    icon: AppImages.security,
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _SettingTileWidget(
                    text: "Пользовательское соглашение",
                    icon: AppImages.notes,
                    onTap: () {},
                  ),
                  const SizedBox(height: 24),
                  _SettingTileWidget(
                    text: "Оценить приложение",
                    icon: AppImages.star,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingTileWidget extends StatelessWidget {
  final String text;
  final String icon;
  final Function onTap;

  const _SettingTileWidget({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: ContainerWidget(
          widget: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Image(
            image: AssetImage(icon),
          )
        ],
      )),
    );
  }
}
