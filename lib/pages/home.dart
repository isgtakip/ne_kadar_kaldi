import "package:date_count_down/date_count_down.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:ne_kadar_kaldi/models/events_model.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EventsModel> events = [];

  void getEvents() {
    events = EventsModel.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    getEvents();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                itemCount: events.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(events[index].backgroundImage),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.07),
                          offset: const Offset(0, 7),
                          blurRadius: 40,
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        top: 15,
                                        bottom: 15,
                                        right: 15),
                                    child: Stack(
                                      children: [
                                        Text(
                                          events[index].eventName,
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..color = Colors.black87
                                                ..strokeWidth = 1),
                                        ),
                                        Text(
                                          events[index].eventName,
                                          softWrap: true,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black87,
                                                offset: Offset(0, 0),
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              child: Stack(children: [
                                CountDownText(
                                  due: DateTime.parse(
                                      events[index].eventEndDate),
                                  finishedText: "Done",
                                  showLabel: false,
                                  longDateName: true,
                                  daysTextLong: " GÜN ",
                                  hoursTextLong: " SAAT ",
                                  minutesTextLong: " DAKİKA ",
                                  secondsTextLong: " SANİYE ",
                                  style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w600,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..color = Colors.black87
                                        ..strokeWidth = 1),
                                ),
                                CountDownText(
                                  due: DateTime.parse(
                                      events[index].eventEndDate),
                                  finishedText: "Done",
                                  showLabel: false,
                                  longDateName: true,
                                  daysTextLong: " GÜN ",
                                  hoursTextLong: " SAAT ",
                                  minutesTextLong: " DAKİKA ",
                                  secondsTextLong: " SANİYE ",
                                  style: const TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black87,
                                        offset: Offset(0, 0),
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: LinearProgressIndicator(
                                value: 0.7,
                                color: Colors.greenAccent, //<-- SEE HERE
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Yaklaşan bir etkinlik arayın..',
            hintStyle: const TextStyle(color: Color(0xffDDDADA)),
            prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg')),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  const VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset('assets/icons/Filter.svg')),
                ]),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Yaklaşan Etkinlikler',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              width: 5,
              height: 5,
            ),
          ),
        )
      ],
    );
  }
}
