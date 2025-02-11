import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      // Define colors using the color scheme
      colorScheme: const ColorScheme(
        primary: Color(0xFF1255FE),
        secondary: Colors.black,
        surface: Colors.white,
        error: Color(0xFFFB0101),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF171717),
        onError: Colors.white,
        brightness: Brightness.light,
      ),

      cardTheme: CardTheme(
        color: const Color(0xffF5F5F5),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      primaryColor: Colors.white,

      hintColor: const Color(0xFF1255FE),

      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: const Color(0xFF3F3E8F),
          fontSize: 28.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          color: const Color(0xff191919),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
        displaySmall: TextStyle(
          color: const Color(0xFFA5A5A5),
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
        ),
        bodyLarge: TextStyle(
          color: const Color(0xFF909090),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
        bodyMedium: TextStyle(
          color: const Color(0xFF757474),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
        bodySmall: TextStyle(
          color: const Color(0xFF545454),
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
        headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
        ),
        headlineMedium: TextStyle(
          color: const Color(0xff232323),
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        labelLarge: TextStyle(
          color: const Color(0xFF1255FE),
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
        ),
        labelMedium: TextStyle(
          color: const Color(0xFFA6A6A6),
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
      // Dropdown menu theme
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.5.w,
            ),
          ),
        ),
        menuStyle: MenuStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.white),
          elevation: const WidgetStatePropertyAll(4),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          minimumSize: WidgetStateProperty.all(Size(358.w, 60.h)),
          maximumSize: WidgetStateProperty.all(Size(358.w, 60.h)),
          backgroundColor: WidgetStateProperty.all(const Color(0xFF3F3E8F)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(20),
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1.w,
            color: const Color(0xFFCCCCCC),
          ),
        ),
        hintStyle: TextStyle(
          color: const Color(0xFFCCCCCC),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1.w,
            color: const Color(0xffCCCCCC),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1.w,
            color: Colors.black26,
          ),
        ),
      ),

      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    );
  }
}
