// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/helper.dart';
import 'package:flutter_doctor_app/models/doctor.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class DoctorAppGridMenu extends StatelessWidget {
  const DoctorAppGridMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisSpacing: 8),
      itemCount: doctorMenu.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 81,
            ),
            child: Column(
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Svg('assets/svg/${doctorMenu[index].image}'),
                    ),
                  ),
                ),
                addVerticalPadding(4),
                Expanded(
                  child: Text(
                    doctorMenu[index].name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
