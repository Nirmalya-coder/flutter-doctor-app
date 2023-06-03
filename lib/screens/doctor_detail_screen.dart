// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/components/doctor_detail_bar.dart';
import 'package:flutter_doctor_app/constants.dart';
import 'package:flutter_doctor_app/helper.dart';
import 'package:flutter_doctor_app/models/doctor.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctor;
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: doctor.doctorPicture,
            child: Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: kGreyColor600,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/${doctor.doctorPicture}'),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Svg('assets/svg/icon-back.svg'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Svg('assets/svg/icon-bookmark.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalPadding(24),
                Hero(
                  tag: doctor.doctorName,
                  child: Text(
                    doctor.doctorName,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                addVerticalPadding(8),
                Text(
                  '${doctor.doctorSpecialty} • ${doctor.doctorHospital}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                addVerticalPadding(16),
                Text(
                  '${doctor.doctorName} ${doctor.doctorDescription}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: kGreyColor700,
                        fontFamily: GoogleFonts.sourceSerifPro().fontFamily,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                addVerticalPadding(16),
                Spacer(),
                DoctorDetailBar(
                  doctor: doctor,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kBlueColor,
                        image: DecorationImage(
                          image: Svg(
                            'assets/svg/icon-chat.svg',
                            size: Size(36, 36),
                          ),
                        ),
                      ),
                    ),
                    addHorizontalPadding(16),
                    Container(
                      height: 56,
                      width: MediaQuery.of(context).size.width - 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kGreenColor,
                      ),
                      child: Center(
                        child: Text(
                          'Make an Appointment',
                          style:
                              Theme.of(context).textTheme.headlineSmall!.copyWith(
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                addVerticalPadding(24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
