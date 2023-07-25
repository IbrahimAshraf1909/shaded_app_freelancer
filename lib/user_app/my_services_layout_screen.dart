import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaded_app_freelancer/main.dart';


enum Choices { quickOption, trackingOption, otherOption }

Map<Choices, Widget> choicesPages = <Choices, Widget>{
  // Choices.quickOption: UserQuickOption(),
  // Choices.trackingOption: UserQuickOption(),
  // Choices.otherOption: UserOtherOption()
};

List<String> headers = ["بيك آب", "دينات وشاحنات", "آخرى"];

class MyOptions extends StatefulWidget {
  const MyOptions({super.key});

  @override
  State<MyOptions> createState() => _MyOptionsState();
}

class _MyOptionsState extends State<MyOptions> {
  Choices selectedSegment = Choices.quickOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(headers[selectedSegment.index], style: const TextStyle()),
        toolbarHeight: 60,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 30,
                child: CupertinoNavigationBar(
                  automaticallyImplyLeading: false,
                  leading: null,
                  trailing: null,
                  padding: const EdgeInsetsDirectional.all(2),
                  middle: CupertinoSlidingSegmentedControl<Choices>(
                    padding: const EdgeInsets.all(5),
                    thumbColor: ShadedApp.appColor,
                    groupValue: selectedSegment,
                    onValueChanged: (Choices? value) {
                      if (value != null) {
                        setState(() {
                          selectedSegment = value;
                        });
                      }
                    },
                    children: <Choices, Widget>{
                      Choices.quickOption: Center(
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'بيك آب',
                            style: TextStyle(
                                color: selectedSegment == Choices.quickOption
                                    ? CupertinoColors.white
                                    : const Color.fromRGBO(153, 153, 153, 1)),
                          ),
                        ),
                      ),
                      Choices.trackingOption: Center(
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'دينات وشاحنات',
                            style: TextStyle(
                                color: selectedSegment == Choices.trackingOption
                                    ? CupertinoColors.white
                                    : const Color.fromRGBO(153, 153, 153, 1)),
                          ),
                        ),
                      ),
                      Choices.otherOption: Center(
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'آخرى',
                            style: TextStyle(
                                color: selectedSegment == Choices.otherOption
                                    ? CupertinoColors.white
                                    : const Color.fromRGBO(153, 153, 153, 1)),
                          ),
                        ),
                      ),
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Center(
                  child: choicesPages[selectedSegment],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
