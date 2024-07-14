import 'package:avia_app/core/constants/constants.dart';
import 'package:avia_app/features/1_home_page/presentation/widgets/search_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String toCity = 'toCity';
  String fromCity = 'fromCity';
  String departureDate = '';
  String arrivalDate = '';
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ru', null).then((_) {
      setState(() {
        departureDate = getCurrentMonthAndDay();
      });
    });
  }

  String getCurrentMonthAndDay() {
    var date = DateTime.now();
    var formattedDate = DateFormat('d MMM, E', 'ru').format(date);
    formattedDate = formattedDate.replaceAll('.', '');
    return formattedDate;
  }

  Future<void> showBackDateCalendar(bool isDepartureDate) async {
    DateTime? selectedDate = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2025));
    if (selectedDate != null) {
      var formattedDate = DateFormat('d MMM, E', 'ru').format(selectedDate);
      formattedDate = formattedDate.replaceAll('.', '');
      setState(() {
        if (isDepartureDate) {
          departureDate = formattedDate;
        } else {
          arrivalDate = formattedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 75),
          Container(
            width: 350,
            height: 105,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    fromCity,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    var temp = toCity;
                                    toCity = fromCity;
                                    fromCity = temp;
                                  });
                                },
                                child: const Icon(
                                  Icons.swap_vert,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 1,
                            width: 320,
                            color: Colors.grey[700],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    toCity,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const ImageIcon(
                                AssetImage(clearMarkIconImagePath),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                InkWell(
                    child: SearchOptions(
                        text: arrivalDate,
                        imageIconPath: 'lib/assets/images/icons/plus_icon.png'),
                    onTap: () async => await showBackDateCalendar(false)),
                InkWell(
                    child: SearchOptions(text: departureDate),
                    onTap: () async => await showBackDateCalendar(true)),
                const SearchOptions(
                    text: '1, эконом',
                    imageIconPath:
                        'lib/assets/images/icons/passengers_icon.png')
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            width: 350,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8)),
            child: const Center(
              child: Text(
                'Посмотреть все билеты',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            width: 350,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      ImageIcon(
                        AssetImage(
                            'lib/assets/images/icons/notifications_icon.png'),
                        color: Colors.blue,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Подписка на цену',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scaleX: 0.65,
                    scaleY: 0.65,
                    child: CupertinoSwitch(
                        value: isChecked,
                        activeColor: Colors.blue,
                        onChanged: (bool value) {
                          setState(() {
                            isChecked = value;
                          });
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
