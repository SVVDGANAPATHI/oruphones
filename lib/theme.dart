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

      textTheme:  TextTheme(
        displayLarge: TextStyle(
          color: const Color(0xFF1255FE),
          fontSize: 32.sp,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: const Color(0xff000000),
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Figtree',
        ),
        displaySmall: TextStyle(
          color: const Color(0xFFA5A5A5),
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Figtree',
        ),
        bodyLarge: TextStyle(
          color: const Color(0xFF909090),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Figtree',
        ),
        bodyMedium: TextStyle(
          color: const Color(0xFFA5A5A5),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Figtree',
        ),
        bodySmall: TextStyle(
          color: const Color(0xFF545454),
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Figtree',
        ),
        headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Figtree',
        ),
        headlineMedium: TextStyle(
          color: const Color(0xff232323),
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Figtree',
        ),
        labelLarge: TextStyle(
          color: const Color(0xFF1255FE),
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Figtree',
        ),
        labelMedium: TextStyle(
          color: const Color(0xFFA6A6A6),
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Figtree',
        ),
      ),
      // Dropdown menu theme
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme:  InputDecorationTheme(
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
        textStyle:  TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Figtree',
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
             TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Figtree',
            ),
          ),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          minimumSize: WidgetStateProperty.all( Size(380.w, 60.h)),
          maximumSize: WidgetStateProperty.all( Size(400.w, 60.h)),
          backgroundColor: WidgetStateProperty.all(const Color(0xFF171717)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(21),
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:  BorderSide(
            width: 1.w,
            color: const Color(0xFFEAEAEA),
          ),
        ),
        hintStyle:  TextStyle(
          color: const Color(0xFFEAEAEA),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Figtree',
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:  BorderSide(
            width: 1.w,
            color: const Color(0xffA6A6A6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:  BorderSide(
            width: 1.w,
            color: Colors.black26,
          ),
        ),
      ),

      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    );
  }
}
