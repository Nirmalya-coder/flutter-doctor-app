// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/constants.dart';
import 'package:flutter_doctor_app/helper.dart';
import 'package:flutter_doctor_app/models/doctor.dart';

class DoctorDetailBar extends StatelessWidget {
  const DoctorDetailBar({Key? key, required this.doctor}) : super(key: key);
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Experience',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: kBlackColor900,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              addVerticalPadding(8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    doctor.doctorYearOfExperience,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: kBlueColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  addHorizontalPadding(4),
                  Text(
                    'yr',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 56,
            color: kGreyColor400,
          ),
          Column(
            children: [
              Text(
                'Patient',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: kBlackColor900,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              addVerticalPadding(8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    doctor.doctorNumberOfPatient,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: kBlueColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  addHorizontalPadding(4),
                  Text(
                    'ps',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 56,
            color: kGreyColor400,
          ),
          Column(
            children: [
              Text(
                'Rating',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: kBlackColor900,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              addVerticalPadding(8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    doctor.doctorRating,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: kBlueColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
