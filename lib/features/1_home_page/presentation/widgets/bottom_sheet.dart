import 'package:avia_app/config/themes/colors.dart';
import 'package:avia_app/core/constants/constants.dart';
import 'package:avia_app/features/1_home_page/presentation/widgets/popular_destination.dart';
import 'package:avia_app/features/1_home_page/presentation/widgets/stub_actions.dart';
import 'package:flutter/material.dart';

class HomeBottomSheet extends StatefulWidget {
  const HomeBottomSheet({super.key, required this.fromCity});
  final String fromCity;

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  final TextEditingController _textEditingControllerWhere =
      TextEditingController();
  bool isClearIconVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
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
                      Text(
                        widget.fromCity,
                        style: const TextStyle(
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
                              value.isNotEmpty
                                  ? setState(() => isClearIconVisible = true)
                                  : setState(() => isClearIconVisible = false);
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
                                hintText: 'Куда - Турция',
                                hintStyle: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                suffixIcon: isClearIconVisible
                                    ? IconButton(
                                        icon: const ImageIcon(
                                          AssetImage(clearMarkIconImagePath),
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          _textEditingControllerWhere.clear();
                                          setState(
                                              () => isClearIconVisible = false);
                                        },
                                      )
                                    : null),
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
                const StubActions(
                  imagePath: routeIconImagePath,
                  text: 'Сложный\nмаршрут',
                  backgroundColor: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
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
                      onTap: () {
                        _textEditingControllerWhere.text = 'Куда угодно';
                        setState(() => isClearIconVisible = true);
                      }),
                ),
                StubActions(
                  imagePath: calendarIconImagePath,
                  text: 'Выходные',
                  backgroundColor: AppColors.darkBlue,
                ),
                StubActions(
                  imagePath: fireIconImagePath,
                  text: 'Горячие\n билеты',
                  backgroundColor: AppColors.red,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            height: 245,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                GestureDetector(
                  child: const PopularDestination(
                      cityName: 'Стамбул', imagePath: stambulImagePath),
                  onTap: () => _textEditingControllerWhere.text = 'Стамбул',
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  height: 1,
                  width: 320,
                  color: Colors.grey[700],
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  child: const PopularDestination(
                      cityName: 'Сочи', imagePath: sochiImagePath),
                  onTap: () => _textEditingControllerWhere.text = 'Сочи',
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  height: 1,
                  width: 320,
                  color: Colors.grey[700],
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  child: const PopularDestination(
                      cityName: 'Пхукет', imagePath: phuketImagePath),
                  onTap: () => _textEditingControllerWhere.text = 'Пхукет',
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  height: 1,
                  width: 320,
                  color: Colors.grey[700],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
