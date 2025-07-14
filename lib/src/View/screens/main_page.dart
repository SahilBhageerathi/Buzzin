import 'package:buzzin/src/View/screens/pinned_chats.dart';
import 'package:buzzin/src/View/screens/recent_chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PinnedChatsPage(),
          DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 0.6.h,
            maxChildSize: 1,
            builder: (context,scrollController){
              return ListView(
                controller: scrollController,
                children: const [
                 RecentChatsPage(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
