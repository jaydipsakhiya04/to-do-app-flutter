import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ScreenUtilsScreen extends StatefulWidget {
  const ScreenUtilsScreen({Key? key}) : super(key: key);

  @override
  State<ScreenUtilsScreen> createState() => _ScreenUtilsScreenState();
}

class _ScreenUtilsScreenState extends State<ScreenUtilsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen Utils"),),
      body: Center(
        child: Container(
          // height:300.h,
          // width: 300.w,
          height: 250.r,
          width: 250.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),   // border radius mate
            color: Colors.red.shade100,
          ),
          // padding: EdgeInsets.all(10.r),  // badhi side
          padding: EdgeInsets.only(
            left: 10.w,
            right: 15.w,
            top: 8.h,
            bottom: 7.h,
          ),
          alignment: Alignment.center,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("height ---  ",style: TextStyle(fontSize: 20.sp),),
              50.h.verticalSpace,
              50.w.horizontalSpace,
              Text("width ---  "),
            ],
          ),
        ),
      ),
    );
  }
}





/*
.sh --->  full screen height mate
.sw --->  full screen width mate
.w --->   width mate
.h --->   height mate
.sp --->  fontsize aapva mate
.r  --->  borderradius pachhi
          jyare widget ni height and width sarkhi hoy tyare height and width banne ni pachhal .r karvo
          padding all hoy tyare


50.h.verticalSpace       ---->       ubhu sizedBox (height)
50.w.horizontalSpace     ---->       aadu sizedBox (width)*/
