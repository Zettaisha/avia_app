import 'package:avia_app/core/constants/constants.dart';
import 'package:avia_app/features/1_home_page/presentation/widgets/search_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
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
                        onPressed: () {
                          // TODO: свап местами значений отправки и прибытия
                        },
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'widget.fromCity',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.swap_vert,
                                  color: Colors.white,
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'widget.toCity',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                ImageIcon(
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
            const Row(
              children: [
                SearchOptions(
                    text: 'Обратно',
                    imageIconPath: 'lib/assets/images/icons/plus_icon.png'),
                SearchOptions(text: '24 фев, сб'),
                SearchOptions(
                    text: '1, эконом',
                    imageIconPath:
                        'lib/assets/images/icons/passengers_icon.png')
              ],
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
                        Icon(
                          Icons.notification_important,
                          color: Colors.blue,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Подписка на цену',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Transform.scale(
                      scale: 0.65,
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
      ),
    );
  }
}
