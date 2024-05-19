import 'package:avia_app/config/themes/colors.dart';
import 'package:avia_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeBottomSheet extends StatefulWidget {
  const HomeBottomSheet({super.key});

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  final TextEditingController _textEditingControllerWhere =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900], // Use a color or your custom color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.94,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: 350,
            height: 105,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ImageIcon(
                          const AssetImage(planeIconImagePath),
                          color: AppColors.grey6,
                        ),
                      ),
                      const Text(
                        'Москва',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Container(
                    height: 1,
                    width: 320,
                    color: Colors.grey[700],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ImageIcon(
                          const AssetImage(searchIconImagePath),
                          color: AppColors.grey6,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 43,
                          child: TextField(
                            controller: _textEditingControllerWhere,
                            onChanged: (value) {
                              String filteredValue =
                                  value.replaceAll(RegExp(r'[^а-яА-Я ]'), '');
                              if (value != filteredValue) {
                                _textEditingControllerWhere.value =
                                    TextEditingValue(
                                  text: filteredValue,
                                  selection: TextSelection.collapsed(
                                      offset: filteredValue.length),
                                );
                              }
                            },
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Откуда - Москва',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Center(
                          child: ImageIcon(
                            AssetImage(routeIconImagePath),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        'Сложный\n маршрут',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: fontSfProDisplay,
                            fontSize: 14,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Center(
                          child: ImageIcon(
                            AssetImage(globeIconImagePath),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        'Куда угодно',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: fontSfProDisplay,
                            fontSize: 14,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            color: AppColors.darkBlue,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Center(
                          child: ImageIcon(
                            AssetImage(calendarIconImagePath),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        'Выходные',
                        textAlign: TextAlign.center, // Center the text
                        style: TextStyle(
                            fontFamily: fontSfProDisplay,
                            fontSize: 14,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Center(
                          child: ImageIcon(
                            AssetImage(fireIconImagePath),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        'Горячие\n билеты',
                        textAlign: TextAlign.center, // Center the text
                        style: TextStyle(
                            fontFamily: fontSfProDisplay,
                            fontSize: 14,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
