import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerNameScreen extends StatefulWidget {
  const CustomerNameScreen({super.key});

  @override
  State<CustomerNameScreen> createState() => _CustomerNameScreenState();
}

class _CustomerNameScreenState extends State<CustomerNameScreen> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.close, size: 35.r),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 236.h,
                    width: 136.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10.h),
                        SizedBox(height: 61.h, width: 116.w, child: Image.asset('assets/Logo.png')),
                        SizedBox(
                          height: 66.h,
                          width: 136.w,
                          child: Column(
                            children: [
                              Text(
                                'Welcome',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'Sign up to Continue',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h), // Added some spacing
              SizedBox(
                height: 100.h,
                width: 358.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Badge(
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
                    SizedBox(height: 5.h),
                    TextFormField(
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
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              ElevatedButton(
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
