import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:riverpod_todo/common/widgets/appstyle.dart';
import 'package:riverpod_todo/common/widgets/custom_text_field.dart';
import 'package:riverpod_todo/common/widgets/height_spacer.dart';
import 'package:riverpod_todo/common/widgets/reusable_texts.dart';
import 'package:riverpod_todo/common/widgets/width_spacer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  final TextEditingController search = TextEditingController();
  late final TabController tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Dashboard",
                      style: appstyle(18, AppConst.kLight, FontWeight.bold),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: AppConst.kLight,
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppConst.kRadius),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.add,
                          color: AppConst.kBkDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              HeightSpacer(hght: 17),
              CustomTextField(
                hintText: "Search",
                controller: search,
                prefixIcon: Container(
                  padding: EdgeInsets.all(4.h),
                  child: GestureDetector(
                    onTap: null,
                    child: Icon(AntDesign.search1),
                  ),
                ),
                suffixIcon: Icon(FontAwesome.sliders),
              ),
              HeightSpacer(hght: 15),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView(
            children: [
              HeightSpacer(hght: 10),
              Row(
                children: [
                  Icon(
                    FontAwesome.tasks,
                    size: 20,
                    color: AppConst.kLight,
                  ),
                  WidthSpacer(wydth: 10),
                  ReusableText(
                    text: "Today's Task",
                    style: appstyle(17, AppConst.kLight, FontWeight.bold),
                  ),
                ],
              ),
              HeightSpacer(hght: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppConst.kLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConst.kRadius),
                  ),
                ),
                child: TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: AppConst.kGreyLight,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    labelPadding: EdgeInsets.zero,
                    isScrollable: false,
                    labelStyle: appstyle(20, AppConst.kGreen, FontWeight.bold),
                    labelColor: AppConst.kGreen,
                    unselectedLabelColor: AppConst.kLight,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppConst.kWidth * 0.5,
                          child: Center(
                            child: ReusableText(
                                text: "Pending",
                                style: appstyle(
                                    16, AppConst.kGreyBk, FontWeight.bold)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.only(left: 25.w),
                          width: AppConst.kWidth * 0.5,
                          child: Center(
                            child: ReusableText(
                                text: "Completed",
                                style: appstyle(
                                    16, AppConst.kGreyBk, FontWeight.bold)),
                          ),
                        ),
                      ),
                    ]),
              ),
              HeightSpacer(hght: 18),
              SizedBox(
                height: AppConst.kHeight * 0.3,
                width: AppConst.kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        height: AppConst.kHeight * 0.3,
                        color: AppConst.kBKLight,
                      ),
                      Container(
                        height: AppConst.kHeight * 0.3,
                        color: AppConst.kGreen,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
