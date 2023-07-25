import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shaded_app_freelancer/main.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            // Get.to( UserHomeLayout()),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            )),
        title: const Text("الإشعارات",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
      ),
      body: Center(
        child: Column(
          children: [
            customListTileWidgetWithDescription(context,
                // icon: Icons.notifications_none_rounded,
                isSvg: true,
                svgIcon: 'assets/icons/notification.svg',
                circleColor: const Color.fromRGBO(242, 216, 216, 1),
                title: "طلبك رقم 068031 يتم تنفيذه الآن \nنقل البضائع من مكة المكرمة الى الرياض",
                isIcon: false,
                widget: const Icon(Icons.more_horiz),
                isScreen: false,
                description: 'الآن'),
            customListTileWidgetWithDescription(context,
                // icon: Icons.notifications_none_rounded,
                isSvg: true,
                svgIcon: 'assets/icons/notification.svg',
                circleColor: const Color.fromRGBO(204, 232, 244, 1),
                title: "لقد تم الانتهاء من طلب رقم 068031 \nيرجى تقييم الخدمة",
                isIcon: false,
                widget: const Icon(Icons.more_horiz),
                iconColor: Colors.blue,
                isScreen: false,
                description: 'منذ 20 دقيقة'),
            customListTileWidgetWithDescription(context,
                // icon: Icons.notifications_none_rounded,
                isSvg: true,
                svgIcon:'assets/icons/notification.svg',
                circleColor: const Color.fromRGBO(241, 241, 241, 1),
                title: "جاري تنفيذ طلبك رقم 345466 \nبرجاء مراجعة مزود الخدمة",
                isIcon: false,
                widget: const Icon(Icons.more_horiz),
                isScreen: false,
                description: 'منذ ساعة'),
          ],
        ),
      ),
    );
  }
}

Widget customListTileWidgetWithDescription(BuildContext context ,{required String title,
        required String description,
        required bool isIcon,
        required bool isScreen,
        Color? circleColor,
        IconData? icon,
        bool isSvg = true,
        required String svgIcon,
        Color? iconColor,
        Widget? widget,
        Widget? screen}){
  return  ListTile(
      leading: CircleAvatar(
          radius: 24,
          backgroundColor: circleColor ?? ShadedApp.appColor,
          child: isSvg
              ? Center(child: SvgPicture.asset(svgIcon))
              : Icon(
                  icon!,
                  color: circleColor == null ? Colors.white : iconColor,
                  size: 28,
                )),
      title: Text(title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 13.0)),
      subtitle: Text(description,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w200, fontSize: 10.0)),
      trailing: isIcon
          ? const Icon(
              Icons.arrow_forward_ios,
              color: Color.fromRGBO(102, 102, 102, 1),
              size: 16,
            )
          : widget,
      onTap: () => isScreen ? Get.to(screen) : null,
    );
}