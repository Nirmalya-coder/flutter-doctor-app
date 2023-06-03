// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/components/doctor_app_grid_menu.dart';
import 'package:flutter_doctor_app/components/home_screen_navbar.dart';
import 'package:flutter_doctor_app/components/top_doctors_list.dart';
import 'package:flutter_doctor_app/constants.dart';
import 'package:flutter_doctor_app/helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeScreenNavbar(),
                addVerticalPadding(30),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.displayLarge,
                    children: [
                      TextSpan(
                        text: 'Find ',
                      ),
                      TextSpan(
                        text: 'your doctor',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: kGreyColor900),
                      ),
                    ],
                  ),
                ),
                addVerticalPadding(24),
                Container(
                  height: 56,
                  padding: EdgeInsets.only(
                    right: 16,
                    left: 24,
                    bottom: 5,
                    top: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kGreyColor500,
                  ),
                  child: TextField(
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: kBlackColor900),
                    cursorHeight: 24,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search_rounded,
                        color: kBlackColor900,
                      ),
                      suffixIconConstraints: BoxConstraints(maxHeight: 24),
                      hintText: 'Search doctor, medicines etc',
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                      contentPadding: EdgeInsets.only(bottom: 5),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                addVerticalPadding(24),
                DoctorAppGridMenu(),
                addVerticalPadding(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Doctors',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      'View all',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: kBlueColor),
                    ),
                  ],
                ),
                addVerticalPadding(24),
                TopDoctorsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
