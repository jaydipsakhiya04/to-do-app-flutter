import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../comman_widget/custom_dropdown_widget.dart';
import '../comman_widget/custom_textfield_widget.dart';

class FillCarDetailsScreen extends StatefulWidget {
  const FillCarDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FillCarDetailsScreen> createState() => _FillCarDetailsScreenState();
}

class _FillCarDetailsScreenState extends State<FillCarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fill Car Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              200.h.verticalSpace,
              const Text(
                "Car Details",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 18),
              ),
              50.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomDropDownWidget(
                        label: "Car Type",
                          selectedValue: 'Sedan',
                          items: ['Sedan', 'Hyundai', '3', '4'])),
                  30.w.horizontalSpace,
                  Expanded(
                      child: CustomDropDownWidget(
                        label: "Number",
                          selectedValue: '1', items: ['1', '2', '3', '4'])),
                ],
              ),
              10.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomDropDownWidget(
                          label: "Car Type",
                          selectedValue: 'Sedan',
                          items: ['Sedan', 'Hyundai', '3', '4'])),
                  30.w.horizontalSpace,
                  Expanded(
                      child: CustomDropDownWidget(
                          label: "Number",
                          selectedValue: '1', items: ['1', '2', '3', '4'])),
                ],
              ),
              10.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomDropDownWidget(
                          label: "Car Type",
                          selectedValue: 'Sedan',
                          items: ['Sedan', 'Hyundai', '3', '4'])),
                  30.w.horizontalSpace,
                  Expanded(
                      child: CustomTextField(
                        isShowBorder: true,
                        hintText: "200",
                        label: "Data",
                      ),
                  ),
                ],
              ),
              10.h.verticalSpace,
              Row(
                children: [
                  Expanded(child: CustomTextField(isShowBorder: true,label: "Max Speed",)),
                  30.w.horizontalSpace,
                  Expanded(child: Container())
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
