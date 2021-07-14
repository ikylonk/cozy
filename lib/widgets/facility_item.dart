import 'package:bwa_cozy/models/facility_models.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class FacilityItem extends StatelessWidget {
  final Facility facility;

  FacilityItem({this.facility});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          facility.imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(
            text: '${facility.total} ',
            style: purpleTextStyle,
            children: [TextSpan(text: facility.title, style: greyTextStyle)]))
      ],
    );
  }
}
