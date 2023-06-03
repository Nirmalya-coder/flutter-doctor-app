// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/constants.dart';
import 'package:flutter_doctor_app/helper.dart';
import 'package:flutter_doctor_app/models/doctor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TopDoctorsCard extends StatelessWidget {
  const TopDoctorsCard({Key? key, required this.doctor}) : super(key: key);
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        color: Colors.transparent,
        height: 80,
        width: MediaQuery.of(context).size.width - 48,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: doctor.doctorPicture,
              child: Container(
                width: 88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kGreyColor600,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/${doctor.doctorPicture}'),
                  ),
                ),
              ),
            ),
            addHorizontalPadding(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: doctor.doctorName,
                    child: Text(
                      doctor.doctorName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Text(
                    '${doctor.doctorSpecialty} • ${doctor.doctorHospital}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          RatingBar.builder(
                            itemSize: 16,
                            initialRating: double.parse(doctor.doctorRating),
                            itemBuilder: (context, _) =>
                                Icon(Icons.star, color: kYellowColor),
                            onRatingUpdate: (rating) {},
                            unratedColor: kGreyColor600,
                          ),
                          addHorizontalPadding(4),
                          Text(
                            '(${doctor.doctorNumberOfPatient})',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: kGreyColor700),
                          ),
                        ],
                      ),
                      Container(
                        height: 24,
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: doctor.doctorIsOpen
                              ? kGreenLightColor
                              : kRedLightColor,
                        ),
                        child: Text(
                          doctor.doctorIsOpen ? 'Open' : 'Close',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: doctor.doctorIsOpen
                                      ? kGreenColor
                                      : kRedColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
