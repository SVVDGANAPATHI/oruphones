import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isuser = false;

  List<Map<String, String>> actioncards = [
    {'icon': 'assets/howtobuy.png', 'name': 'How to Buy'},
    {'icon': 'assets/howtosell.png', 'name': 'How to Sell'},
    {'icon': 'assets/oruguide.png', 'name': 'Oru Guide'},
    {'icon': 'assets/aboutus.png', 'name': 'About Us'},
    {'icon': 'assets/Privacypolicy.png', 'name': 'Privacy Policy'},
    {'icon': 'assets/FAQ.png', 'name': 'FAQs'},
  ];

  List<Map<String, String>> mindcards = [
    {'icon': 'assets/buyusedphones.png', 'name': 'Buy Used Phones'},
    {'icon': 'assets/sellusedphones.png', 'name': 'Sell Used Phones'},
    {'icon': 'assets/compareprices.png', 'name': 'Compare Prices'},
    {'icon': 'assets/profile.png', 'name': 'My Profile'},
    {'icon': 'assets/listing.png', 'name': 'My Listing'},
    {'icon': 'assets/openstore.png', 'name': 'Open Store'},
    {'icon': 'assets/services.png', 'name': 'Services'},
    {'icon': 'assets/devicehealth.png', 'name': 'Device Health Check'},
    {'icon': 'assets/batteryhealth.png', 'name': 'Battery Health Check'},
    {'icon': 'assets/imei.png', 'name': 'IMEI Verification'},
    {'icon': 'assets/devicedetails.png', 'name': 'Device Details'},
    {'icon': 'assets/dataclean.png', 'name': 'Data Wipe'},
    {'icon': 'assets/underwarrantyphones.png', 'name': 'Under Warranty Phones'},
    {'icon': 'assets/premiumphones.png', 'name': 'Premium Phones'},
    {'icon': 'assets/likenewphones.png', 'name': 'Like New Phones'},
  ];

  int _currentIndex = 0;

  final List<String> imageList = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
    'assets/image4.png',
  ];

  List<String> options = [
    'Sell Used Phones',
    'Buy Used Phones',
    'Compare Prices',
    'My Profile',
    'My Listings',
    'Services',
    'Register your Store',
    'Get the App'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(context),
        drawer: builddrawer(),
        body: buildBody(context),
      ),
    );
  }

  Widget buildcard(Map<String, String> actioncard) {
    return Container(
      height: 40.h,
      width: 85.w,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(color: Color(0xFFCCCCCC)), borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            actioncard['icon'].toString(),
            height: 25,
            width: 20,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            actioncard['name'].toString(),
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 9.sp),
          )
        ],
      ),
    );
  }

  Widget builddrawer() {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/Logo2.png', fit: BoxFit.cover),
                    ),
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).closeDrawer();
                        },
                        icon: Icon(Icons.close, size: 30),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Visibility(
                  visible: isuser,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://cdn.prod.website-files.com/60589d22f4be21df8e661b2e/65243b197b8717b0648ae7bc_illustration-4.jpg',
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rahul Sharma',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontWeight: FontWeight.w800, fontSize: 14.sp, color: Color(0xFF000000)),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            'joined: July 6 2024',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 43.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Login/SignUp',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 43.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF6C018), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                    onPressed: () {},
                    child: Text(
                      'Sell Your Phone',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Visibility(
                  visible: isuser,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [Icon(Icons.logout), SizedBox(width: 10.w), Text('Logout')],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(), // Pushes the grid to the bottom
          Container(
            padding: EdgeInsets.all(25.h),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Prevent scrolling inside the drawer
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return buildcard(actioncards[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget buildAppbar(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: Image.asset('assets/drawericon.png'),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Image.asset(
        'assets/Logo2.png',
        height: 24.h,
      ),
      actions: [
        Text(
          'India',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16.sp),
        ),
        SizedBox(
          width: 5.w,
        ),
        Image.asset('assets/location.png'),
        SizedBox(
          width: 10.w,
        ),
        //if user is logged in show notification icon
        Visibility(
          visible: !isuser,
          replacement: IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
          child: SizedBox(
            height: 29.h,
            width: 70.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.center, backgroundColor: Color(0xFFF6C018)),
              onPressed: () {},
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search phones with make, model...',
                hintStyle: TextStyle(color: Color(0xFF707070), fontSize: 14.sp),
                prefixIcon: Icon(Icons.search, color: Color(0xFFFFA500)),
                suffixIcon: Icon(Icons.mic, color: Color(0xFF707070)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 36,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFE0E0E0),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          options[index],
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 12.sp),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 5.w,
                      ),
                  itemCount: options.length),
            ),
            SizedBox(
              height: 15.h,
            ),
            buildcarousel(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'What’s on your mind?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Color(0xFF525252), fontSize: 18.sp),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 136.h,
              child: ListView.separated(
                shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 110.h,
                      width: 72.w,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 72.h,width: 72.h,
                            child: Image.asset(mindcards[index]['icon'].toString(),fit: BoxFit.cover,)),
                          Text(mindcards[index]['name'].toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12.sp,color: Colors.black),)
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                  itemCount: mindcards.length),
            ),
            SizedBox(height: 10.h,),
            Text(
              'What’s on your mind?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Color(0xFF525252), fontSize: 18.sp),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 136.h,
              child: ListView.separated(
                shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 110.h,
                      width: 72.w,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 72.h,width: 72.h,
                            child: Image.asset(mindcards[index]['icon'].toString(),fit: BoxFit.cover,)),
                          Text(mindcards[index]['name'].toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12.sp,color: Colors.black),)
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                  itemCount: mindcards.length),
            )
            
          ],
        ),
      ),
    );
  }

  Widget buildcarousel() {
    return Column(
      children: [
        CarouselSlider(
          items: imageList.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.map((imagePath) {
              int index = imageList.indexOf(imagePath);
              return Container(
                width: _currentIndex == index ? 12.0 : 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFABABAB)),
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Color(0xFFABABAB) : Colors.white,
                ),
              );
            }).toList())
      ],
    );
  }
}
