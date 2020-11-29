import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_test/view/core/my_images.dart';

class PlaceCardPage extends StatelessWidget {
  final String companyAddress;
  final String companyName;
  final String companyReception;
  final String companyReceptionPhone;
  const PlaceCardPage({
    Key key,
    this.companyAddress,
    this.companyReception,
    this.companyReceptionPhone,
    this.companyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 15),
            child: Text(
              companyName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            color: Colors.black26,
            width: double.maxFinite,
            height: 150,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              children: [
                SvgPicture.asset(MyImages.details),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Company Address",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: Text(
              companyAddress,
              style: TextStyle(
                color: Color(0xFF70798C),
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              children: [
                SvgPicture.asset(MyImages.user),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Company Reception",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: Text(
              companyReception,
              style: TextStyle(
                color: Color(0xFF70798C),
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              companyReceptionPhone,
              style: TextStyle(
                color: Color(0xFF70798C),
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
