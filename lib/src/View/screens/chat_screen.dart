import 'package:buzzin/src/View/Core/Resources/app_colors.dart';
import 'package:buzzin/src/View/Core/Resources/svg_images.dart';
import 'package:buzzin/src/View/Core/Utils/app_extensions.dart';
import 'package:buzzin/src/ViewModel/Logic/chat_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final String contactName;
  String? contactImage;

  ChatScreen({super.key, required this.chatId, required this.contactName, this.contactImage});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  TextEditingController controller= TextEditingController();


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<ChatBloc, ChatState>(
      bloc: ChatBloc.instance,
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 1,
            titleSpacing: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Row(
              children: [
                CircleAvatar(
                  radius: 18.r,
                  child: SvgPicture.asset(SvgImages.noUserIcon),
                ),
                15.ws,
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sahil Bhageerathiadadfsdfsfsfsfsfgsssssgfs",
                          style: textTheme.headlineLarge!.copyWith(fontSize: 18.sp,color: AppColors.chatHeading),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Typing...",
                          style: textTheme.headlineMedium!.copyWith(fontSize: 12.sp,color: AppColors.chatSubHeading),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.video_camera_back_rounded),
                ),
                IconButton(onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      AppColors.userOfflineColor.withOpacity(0.5),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: AppColors.chatTextFieldDivider, width: 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              controller: controller,
                              onChanged: (val){
                              },
                              validator: (value){
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter a message';
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: IconButton(icon: const Icon(Icons.emoji_emotions_outlined),onPressed: (){},),
                                prefixIconConstraints: BoxConstraints(
                                  minHeight: 24.h,
                                  minWidth: 24.w,
                                ),
                                fillColor: AppColors.chatTextFieldDivider,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 2.h),
                                hintText: "write a message",
                              ),
                            ),
                          ),
                          10.ws,
                          Expanded(
                            child:
                            Container(
                              height: 40.h,
                              width: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20.h)
                              ),
                              child: Center(
                                child: IconButton(
                                  icon:  Icon(Icons.send,size: 20.h,),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
