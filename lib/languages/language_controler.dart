import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageControler extends GetxController {
  bool isEn = false;

 changeLan(bool lan) async{
    isEn = lan;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn", isEn);
    update();
  }

  getLan() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn = prefs.getBool("isEn")?? true;
    update();
  }

   getTexts(String txt) {
    if (isEn == true){
      update();
      return textsEn[txt];
    } else{
      update();
    return textsAr[txt];
    }
    
  }
  Map<String, Object> textsAr = {

      "hello": "أهلا! 👋",
  "welcome_from_you": "مرحباً بك 👋",
  "welcome": "مرحبا! 👋",
  "select_language_app": "اختر لغة التطبيق",
  "arabic": "العربية",
  "english": "الإنجليزية",
  "change_language_from_settings": "يمكنك تغيير اللغة باي وقت من الإعدادات",
  "next": "التالي",
  "skip": "تخطي",
  "start_now": "ابدأ الان",
   "on_boarding" : [
      "اطلب ما تشاء  وحدد وقت التوصيل الذي يناسبك ونحن نكفيك عناء الشراء والتوصيل.",
 "ارسل طلبك لاي مكان وطلبك بايدي امينة مع ضمان وصولها لنهاية المسار بدون ضرر ولا تلف",
   "هل تملك مركبة؟ انضم لعائلتنا اليوم كمنقذ لتوصيل طلبات زبائننا في وقت فراغك.",
],
  "create_account": "إنشاء حساب",
  "enter_phone_number": "أدخل رقم هاتفك للتحقق",
  "or": "أو تسجيل الدخول بـ",
  "user": "مستخدم",
  "captain": "كابتن",
  "send_verify": "ارسل كود التحقق",
  "code_verify": "كود التحقق",
  "send_code_to": "قم بإدخال كود التحقق المرسل إلى رقم",
  "didnt_send": "لم استلم كود التحقق ؟",
  "send_again": " يرجى إعادة إرسال",
  "verify": "تحقق",
  "is_verify": "يتم التحقق",
  "select_location": "تحديد الموقع",
  "desc_location_page": "من فضلك قم بتحديد الموقع للسماح للتطبيق للوصول إلى موقعك",
  "the_delivery_be_more_easy": "... التوصيل أصبح سهلا",
  "search_on_your_order": "أبحث عن طلبك ...",
  "search":"بحث",
  "our_options": "خدماتنا",
  "quick": "نقل سريع",
  "tracking": "شاحنات و دينات",
  "other": "آخرى",
  "home": "الرئيسية",
  "orders": "الطلبات",
  "messages": "الرسائل",
  "my_account": "حسابي",
  "search": "بحث",
  "notifications": "الإشعارات",
  "pick_up": "بيك آب",
  "long_form_field": "ضع قائمة بجميع الأشياء التي  تريد نقلها  / هل هناك أي تفاصيل أخرى مهمة تود إضافتها؟",
  "last_searches" : "أحدث عمليات البحث",
  "popular_services":"أكثر الخدمات طلباً",

};
  Map<String, Object> textsEn = {
  "hello": "Hello! 👋",
  "welcome_from_you": "Welcome For you 👋",
  "welcome": "Welcome! 👋",
  "select_language_app": "Select app language",
  "arabic": "Arabic",
  "english": "English",
  "change_language_from_settings": "You can change app language from settings",
  "next": "Next",
  "skip": "Skip",
  "start_now": "Start Now",
  "on_boarding":[
    "Order what you want and select the delivery time that suits you, and we will take care of the hassle of buying and delivering.",
   "Send your order to any place and your order in safe hands, while ensuring that it reaches the end of the track without damage or damage",
  "Do you own a vehicle? Join our family today as a savior to deliver our customers' orders in your free time.",
  ],
   "create_account": "Login",
  "enter_phone_number": "Enter your phone number to verify",
  "or": "Or signup via",
  "user": "User",
  "captain": "Captain",
  "send_verify": "Send code verification",
  "code_verify": "Code verification",
  "send_code_to": "Enter code verification to this phone number",
  "didnt_send": "I didn't request the code ?",
  "send_again": "Re-send the code",
  "verify": "verify",
  "is_verify": "loading",
  "select_location": "Select the location",
  "desc_location_page": "Please, Select a location to allow the app to access your location",
  "the_delivery_be_more_easy": "The delivery become more easy ....",
  "search_on_your_order": "Search on your order...",
  "search":"search",
  "our_options": "Our services",
  "quick": "Quick Order",
  "tracking": "Trucks & Cars",
  "other": "Others",
  "home": "Home",
  "orders": "Orders",
  "messages": "Messages",
  "my_account": "My account",
  "search": "Search",
  "notifications": "Notifications",
  "pick_up": "Pick up",
  "long_form_field": "List all the things you want to move / Are there any other important details you would like to add?",
  "last_searches" : "last Searches",
  "popular_services":"Popular Services",
};
}