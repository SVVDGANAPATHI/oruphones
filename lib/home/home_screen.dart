import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oruphones/bloc/auth/auth_bloc.dart';
import 'package:oruphones/bloc/faq/faq_bloc.dart';
import 'package:oruphones/home/dynamic_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isuser = false;
  int? expandedIndex;
  int _currentIndex = 0;
  bool isFavourite = false;
  final String shareText = "Check out this amazing app!";

  List<Map<String, String>> actioncards = [
    {'icon': 'assets/howtobuy.png', 'name': 'How to Buy'},
    {'icon': 'assets/howtosell.png', 'name': 'How to Sell'},
    {'icon': 'assets/oruguide.png', 'name': 'Oru Guide'},
    {'icon': 'assets/aboutus.png', 'name': 'About Us'},
    {'icon': 'assets/Privacypolicy.png', 'name': 'Privacy Policy'},
    {'icon': 'assets/FAQ.png', 'name': 'FAQs'},
  ];

  List<String> topbrands = [
    'assets/brand1.png',
    'assets/brand2.png',
    'assets/brand3.png',
    'assets/brand4.png',
    'assets/brand5.png',
    'assets/brand6.png',
    'assets/brand7.png',
    'assets/morebrands.png',
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
    {'icon': 'assets/refurbished.png', 'name': 'Refurbished Phones'},
    {'icon': 'assets/verifiedphones.png', 'name': 'Verified Phones'},
    {'icon': 'assets/mynegotations.png', 'name': 'My Negotiations'},
    {'icon': 'assets/myfavourites.png', 'name': 'My Favourites'},
  ];

  List<String> shareicons = ['assets/insta.png', 'assets/telegram.png', 'assets/threads.png', 'assets/whatsapp.png'];
  List<String> imageList = [
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

  void _shareContent(BuildContext context) {
    Share.share(shareText);
  }

  // Future<void> _shareOnWhatsApp() async {
  //   String message = shareText;
  //   Uri whatsappUri = Uri.parse("whatsapp://send?text=$message");

  //   if (await canLaunchUrl(whatsappUri)) {
  //     await launchUrl(whatsappUri);
  //   } else {
  //     await launchUrl(Uri.parse("https://web.whatsapp.com/"));
  //   }
  // }

  @override
  void initState(){
    super.initState();
    context.read<FaqBloc>().add(GetFaqDetails());
    getuser();

  }

  void getuser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool userStatus = prefs.getBool('isuser') ?? false;
    setState(() {
      isuser = userStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: 51.h,
          width: 110.w,
          child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.transparent,
              onPressed: () {},
              child: Container(
                width: 110.w,
                height: 52.h,
                decoration: BoxDecoration(
                    color: Color(0xff363636), borderRadius: BorderRadius.circular(44), border: Border.all(color: Color(0xFFF6C018), width: 4)),
                child: Center(
                    child: Text(
                  'SELL +',
                  style: TextStyle(color: Color(0xFFF6C018)),
                )),
              )),
        ),
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
                            'Ganesh',
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
                Visibility(
                  visible: !isuser,
                  child: SizedBox(
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
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<FaqBloc, FaqState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 136.h,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 110.h,
                              width: 80.w,
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 72.h,
                                      width: 72.h,
                                      child: Image.asset(
                                        mindcards[index]['icon'].toString(),
                                        fit: BoxFit.cover,
                                      )),
                                  Text(
                                    mindcards[index]['name'].toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10.w,
                              ),
                          itemCount: mindcards.length),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Brands',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Color(0xFF525252), fontSize: 18.sp),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Color(0xFF525252))
                      ],
                    ),
                    SizedBox(
                      height: 136.h,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 64.h,
                              width: 64.w,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFF2F2F2),
                                child: Image.asset(
                                  topbrands[index].toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10.w,
                              ),
                          itemCount: topbrands.length),
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Best deals ',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Color(0xFF525252), fontSize: 18.sp),
                            children: [
                          TextSpan(
                            text: 'in India',
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500),
                          )
                        ])),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 36.h,
                          width: 85.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xFFD7D7D7))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/sort.png'),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Sort',
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 36.h,
                          width: 85.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xFFD7D7D7))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/Filters.png'),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Filter',
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.5, crossAxisSpacing: 10.w, mainAxisSpacing: 10.h),
                        itemBuilder: (context, index) {
                          return index == 3 || index == 6 ? buildaddcard() : buildSalecard();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Frequently Asked Questions',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Color(0xFF525252), fontSize: 18.sp),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Color(0xFF525252))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildFaqtiles(),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 222.h,
            child: Image.asset(
              'assets/Newsletter.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Color(0xFF363636),
            child: Column(
              children: [
                SizedBox(
                  height: 342.h,
                  child: Image.asset(
                    'assets/Frame.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                color: Color(0xFF363636),
                width: double.infinity,
                height: 237.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          'Invite a Friend',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 20.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Card(
                          elevation: 2,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 238.h,
                            width: 308.w,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Invite a friend to ORUphones application.',
                                  style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  'Tap to copy the respective download link to the clipboard',
                                  style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(height: 56.h, width: 167.w, child: Image.asset('assets/playstore.png')),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(height: 56.h, width: 167.w, child: Image.asset('assets/appstore.png')),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Or Share', style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20.sp)),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/640px-Instagram_logo_2022.svg.png'),
              ),
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Telegram_2019_Logo.svg/800px-Telegram_2019_Logo.svg.png'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Image.network('https://static.dezeen.com/uploads/2023/07/x-logo-twitter-elon-musk_dezeen_2364_col_0.jpg'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //_shareOnWhatsApp;
                  _shareContent(context);
                },
                child: Container(
                  color: Colors.white,
                  height: 40.h,
                  width: 40.w,
                  child: Image.network(
                    'https://w7.pngwing.com/pngs/535/813/png-transparent-call-icon-logo-whatsapp-computer-icons-viber-text-viber-area.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 100.h,
          )
        ],
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

  Widget buildSalecard() {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                // height: 180.h,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                    child: Image.asset(
                      'assets/phone.png',
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                top: 10,
                left: 4,
                child: SizedBox(
                    height: 31.h,
                    width: 100.w,
                    child: Image.asset(
                      'assets/banner.png',
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                top: 12,
                left: 7,
                child: RichText(
                    text: TextSpan(
                        text: 'ORU',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        children: [TextSpan(text: 'Verified', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.normal))])),
              ),
              Positioned(
                top: -3,
                right: 0,
                child: Visibility(
                  visible: !isFavourite, //Favourite icon
                  replacement: IconButton(
                      onPressed: () {
                        isUserOrNot();
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )),
                  child: IconButton(
                      onPressed: () {
                        isUserOrNot();
                      },
                      icon: Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      )),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 27.h,
                  width: 174.w,
                  color: Color(0xFF4C4C4C),
                  child: Center(
                      child: Text(
                    'PRICE NEGOTIABLE',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apple iPhone 13 Pro',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('12/256 GB Like New'),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  text: TextSpan(
                      text: '₹ 41,500',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
                      children: [
                        TextSpan(text: ' '),
                        TextSpan(
                            text: '₹ 81,500',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.lineThrough, fontSize: 12.sp)),
                        TextSpan(text: '(45% off)', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red, fontSize: 10.sp))
                      ]),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nijampur, Luc..',
                  style: TextStyle(fontSize: 12.sp),
                ),
                Text('July 25th', style: TextStyle(fontSize: 12.sp))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildaddcard() {
    return SizedBox(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/ad_image.png',
            fit: BoxFit.cover,
          )),
    );
  }

  //state.getFaq?.faQs[0].question ?? ''
  Widget buildFaqtiles() {
    return BlocConsumer<FaqBloc, FaqState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.getFaq == null) {
          return CircularProgressIndicator();
        } else {
          return SizedBox(
            // height: 300,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                height: 10.h,
              ),
              shrinkWrap: true,
              itemCount: state.getFaq!.faQs.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xFFE0E0E0))),
                  child: ExpansionTile(
                    shape: Border.all(color: Colors.transparent),
                    childrenPadding: EdgeInsets.all(10),
                    trailing: index == expandedIndex
                        ? Icon(
                            Icons.close,
                            color: Colors.grey,
                          )
                        : Icon(Icons.add),
                    title: Text(state.getFaq!.faQs[index].question),
                    children: [Text(state.getFaq!.faQs[index].answer)],
                    onExpansionChanged: (value) {
                      setState(() {
                        expandedIndex = value ? index : null;
                      });
                    },
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  void isUserOrNot() {
    if (isuser == true) {
      setState(() {
        isFavourite = !isFavourite;
      });
    } else {
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return DynamicBottomSheet();
        },
      );
    }
  }
}
