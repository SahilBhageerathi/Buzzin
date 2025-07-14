import 'package:intl/intl.dart';

class DateTimeHelper {
  DateTimeHelper._();
  /// 2025-07-14 11:09:18.620936 ----> 11:09
  static String dateTimeTo24HrFormat(DateTime x) {
    return DateFormat('HH:mm').format(x);
  }

  /// 1720974180000 ----> 18:31 or yesterday or Jul 18 or Jan 2021
  static String lastMessageTime(int epochTime){
    DateTime messageTime = DateTime.fromMillisecondsSinceEpoch(epochTime);
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(const Duration(days: 1));

    bool isToday = messageTime.year == today.year &&
        messageTime.month == today.month &&
        messageTime.day == today.day;
    if(isToday) {
      return dateTimeTo24HrFormat(messageTime);
    }else{
       if(messageTime == yesterday){
         return "Yesterday";
       }else{
         if( messageTime.year == today.year){
           return DateFormat('MMM d').format(messageTime);
         }else{
           return DateFormat('MMM yyyy').format(messageTime);
         }

       }
    }
  }

}
