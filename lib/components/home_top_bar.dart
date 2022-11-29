import 'package:e_commerce/controllers/app.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTopBar extends StatelessWidget {
  final AppController app = Get.find<AppController>();

  HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: Theme.of(context).textTheme.r10,
              ),
              const SizedBox(height: 4),
              Text(
                "${app.user?.fullName}".capitalize ?? "",
                style: Theme.of(context).textTheme.b14,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => app.logout(),
                icon: const Icon(Icons.logout_outlined),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
