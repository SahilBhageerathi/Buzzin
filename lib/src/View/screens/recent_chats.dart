import 'package:buzzin/src/View/Core/CommonWidgets/recent_chats_card.dart';
import 'package:buzzin/src/View/Core/Resources/svg_images.dart';
import 'package:buzzin/src/View/Core/Resources/app_strings.dart';
import 'package:buzzin/src/View/Core/Utils/app_extensions.dart';
import 'package:buzzin/src/View/screens/chat_screen.dart';
import 'package:buzzin/src/View/screens/widgets/tab_name_view.dart';
import 'package:buzzin/src/ViewModel/Logic/Dashboard_bloc/dashboard_bloc.dart';
import 'package:buzzin/src/ViewModel/Logic/Dashboard_bloc/dashboard_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Core/Resources/app_colors.dart';

class RecentChatsPage extends StatefulWidget {
  const RecentChatsPage({super.key});

  @override
  State<RecentChatsPage> createState() => _RecentChatsPageState();
}

class _RecentChatsPageState extends State<RecentChatsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      bloc: DashBoardBloc.instance,
      builder: (context, state) {
        if (_tabController.index != state.selectedTabIndex) {
          DashBoardBloc.instance.changeTab(_tabController.index);
        }
        return state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.r),
                    topRight: Radius.circular(35.r),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        AppColors.userOfflineColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //this widget
                        Center(
                            child: Container(
                          height: 5.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: AppColors.userOfflineColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),),
                        (kToolbarHeight / 2.5).hs,
                        Row(
                          children: [
                            Text(
                              AppStrings.recentChats,
                              style: textTheme.headlineLarge,
                              textAlign: TextAlign.left,
                            ),
                            const Spacer(),
                            IconButton(
                              icon:
                                  SvgPicture.asset(SvgImages.searchIcon, height: 24.h, width: 24.h),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        20.hs,
                        SizedBox(
                          child: TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            labelPadding: EdgeInsets.only(right: 10.w),
                            tabAlignment: TabAlignment.start,
                            indicatorColor: Colors.transparent,
                            indicator: const BoxDecoration(),
                            dividerColor: Colors.transparent,
                            tabs: [
                              TextTab(
                                tabName: AppStrings.allChatsTabName,
                                tabIndex: 0,
                                selectedIndex: state.selectedTabIndex,
                                onTapOfTab: () {
                                  _tabController.animateTo(0);
                                  DashBoardBloc.instance.changeTab(0);
                                },
                              ),
                              TextTab(
                                tabName: AppStrings.groupsTabName,
                                tabIndex: 1,
                                selectedIndex: state.selectedTabIndex,
                                onTapOfTab: () {
                                  _tabController.animateTo(1);
                                  DashBoardBloc.instance.changeTab(1);
                                },
                              ),
                              TextTab(
                                tabName: AppStrings.favouritesTabName,
                                tabIndex: 2,
                                selectedIndex: state.selectedTabIndex,
                                onTapOfTab: () {
                                  _tabController.animateTo(2);
                                  DashBoardBloc.instance.changeTab(2);
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: TabBarView(
                              controller: _tabController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemCount: 5,
                                  separatorBuilder: (context, i) {
                                    return 5.hs;
                                  },
                                  itemBuilder: (context, i) {
                                    return InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  ChatScreen(chatId: "1",contactName: "Sahil Bhageerathi",)),
                                        );
                                      },
                                      child: RecentChatCard(
                                        contactImage: SvgImages.noUserIcon,
                                        index: i,
                                        contactName: "Contact",
                                        lastMessageTime: 1752474556264,
                                        lastMessage:
                                            "hi I will be offline till hi I will be offlsfsdfsdfsdfsfsfsfsfsfsfsfsfsfsfssfsfsfsfsf",
                                      ),
                                    );
                                  },
                                ),
                                ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemCount: 15,
                                  separatorBuilder: (context, i) {
                                    return 5.hs;
                                  },
                                  itemBuilder: (context, i) {
                                    return RecentChatCard(
                                      contactImage: SvgImages.noUserIcon,
                                      index: i,
                                      contactName: "Contact",
                                      lastMessageTime: 1720974180000,
                                      lastMessage:
                                          "hi I will be offline till hi I will be offlsfsdfsdfsdfsfsfsfsfsfsfsfsfsfsfssfsfsfsfsf",
                                    );
                                  },
                                ),
                                ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemCount: 15,
                                  separatorBuilder: (context, i) {
                                    return 5.hs;
                                  },
                                  itemBuilder: (context, i) {
                                    return RecentChatCard(
                                      contactImage: SvgImages.noUserIcon,
                                      index: i,
                                      contactName: "Contact",
                                      lastMessageTime: 1752412200000,
                                      lastMessage:
                                          "hi I will be offline till hi I will be offlsfsdfsdfsdfsfsfsfsfsfsfsfsfsfsfssfsfsfsfsf",
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        )

                        // Container(),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
