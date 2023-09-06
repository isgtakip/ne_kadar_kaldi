class EventsModel {
  String eventName;
  String backgroundImage;
  String eventEndDate;
  bool boxIsSelected;

  EventsModel(
      {required this.eventName,
      required this.backgroundImage,
      required this.eventEndDate,
      required this.boxIsSelected});

  static List<EventsModel> getEvents() {
    List<EventsModel> events = [];

    events.add(EventsModel(
        eventName: "Ramazan Bayramı",
        backgroundImage: "assets/images/ramazan_bayrami.jpeg",
        eventEndDate: "2024-04-10 00:00:00",
        boxIsSelected: false));
    events.add(EventsModel(
        eventName: "Ulusal Egemenlik ve Çocuk Bayramı",
        backgroundImage: "assets/images/23_nisan.jpg",
        eventEndDate: "2024-04-23 00:00:00",
        boxIsSelected: false));
    events.add(EventsModel(
        eventName: "Emek ve Dayanışma Günü",
        backgroundImage: "assets/images/23_nisan.jpg",
        eventEndDate: "2024-05-01 00:00:00",
        boxIsSelected: false));
    events.add(EventsModel(
        eventName: "Kurban Bayramı",
        backgroundImage: "assets/images/kurban.jpg",
        eventEndDate: "2024-23-15 00:00:00",
        boxIsSelected: false));
    events.add(EventsModel(
        eventName: "29 Ekim Cumhuriyet Bayramı",
        backgroundImage: "assets/images/29_ekim.jpg",
        eventEndDate: "2024-04-15 00:00:00",
        boxIsSelected: false));

    events.add(EventsModel(
        eventName: "Yeni Yıl",
        backgroundImage: "assets/images/crismas.jpg",
        eventEndDate: "2024-23-15 00:00:00",
        boxIsSelected: false));

    return events;
  }
}
