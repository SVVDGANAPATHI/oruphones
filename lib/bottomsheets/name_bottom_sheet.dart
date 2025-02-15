import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameBottomSheet extends StatefulWidget {
  const NameBottomSheet({super.key});

  @override
  State<NameBottomSheet> createState() => _NameBottomSheetState();
}

class _NameBottomSheetState extends State<NameBottomSheet> {

 final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sign up to Continue',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16.sp),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
          Divider(
            color: Color(0xFFCCCCCC),
          ),
          SizedBox(height: 30.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Badge(
              label: Text(
                '  *',
                style: TextStyle(fontSize: 16.sp, color: Colors.redAccent),
              ),
              backgroundColor: Colors.transparent,
              child: Text(
                'Please tell us your name',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 12.sp),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Valid User Name';
                }
                return null;
              },
              controller: _nameController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                hintText: '  Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h,),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/homescreen');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Confirm Name',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20.r,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
