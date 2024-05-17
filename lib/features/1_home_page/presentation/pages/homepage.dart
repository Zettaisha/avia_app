import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:avia_app/config/themes/colors.dart';
import 'package:avia_app/core/constants/constants.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_bloc.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_state.dart';
import 'package:avia_app/features/1_home_page/presentation/widgets/music_ticket_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _textEditingControllerFrom =
      TextEditingController();
  final TextEditingController _textEditingControllerWhere =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedValue();
  }

  void _loadSavedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedValue = prefs.getString('lastInput');
    if (savedValue != null) {
      setState(() {
        _textEditingControllerFrom.text = savedValue;
      });
    }
  }

  void _saveInputValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastInput', value);
  }

  @override
  void dispose() {
    _textEditingControllerFrom.dispose();
    _textEditingControllerWhere.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: BlocBuilder<MusicTicketsBloc, HomepageState>(
        builder: (_, state) {
          if (state is MusicTicketsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MusicTicketsError) {
            return const Center(
              child: Icon(Icons.refresh),
            );
          }

          if (state is MusicTicketsDone) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 0, right: 0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Поиск дешевых \nавиабилетов',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 27,
                          height: 1.2,
                          fontFamily: fontSfProDisplay,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Container(
                      width: 360,
                      height: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.grey3,
                      ),
                      child: Container(
                        width: 320,
                        height: 105,
                        decoration: BoxDecoration(
                          color: AppColors.grey4,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 7),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: ImageIcon(
                                  const AssetImage(searchIconImagePath),
                                  color: AppColors.white,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      child: TextField(
                                        controller: _textEditingControllerFrom,
                                        onChanged: (value) {
                                          String filteredValue =
                                              value.replaceAll(
                                                  RegExp(r'[^а-яА-Я ]'), '');
                                          if (value != filteredValue) {
                                            _textEditingControllerFrom.value =
                                                TextEditingValue(
                                              text: filteredValue,
                                              selection:
                                                  TextSelection.collapsed(
                                                      offset:
                                                          filteredValue.length),
                                            );
                                          }
                                          _saveInputValue(filteredValue);
                                        },
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: fontSfProDisplay),
                                        decoration: InputDecoration(
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                          hintText: 'Откуда - Москва',
                                          hintStyle: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: fontSfProDisplay),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: TextField(
                                        controller: _textEditingControllerWhere,
                                        onChanged: (value) {
                                          String filteredValue =
                                              value.replaceAll(
                                                  RegExp(r'[^а-яА-Я ]'), '');
                                          if (value != filteredValue) {
                                            _textEditingControllerWhere.value =
                                                TextEditingValue(
                                              text: filteredValue,
                                              selection:
                                                  TextSelection.collapsed(
                                                      offset:
                                                          filteredValue.length),
                                            );
                                          }
                                        },
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: fontSfProDisplay),
                                        decoration: InputDecoration(
                                          hintText: 'Куда - Турция',
                                          hintStyle: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 17,
                                            fontFamily: fontSfProDisplay,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          border: InputBorder.none,
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 23),
                            child: Text(
                              'Музыкально отлететь',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            height: 230,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.musicTickets!.length,
                              itemBuilder: (context, index) {
                                var musicTicket = state.musicTickets![index];
                                return MusicTicketCard(
                                  musicTicket: musicTicket,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
