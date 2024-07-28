import 'package:avia_app/config/themes/colors.dart';
import 'package:avia_app/features/1_home_page/domain/enitites/search_ticket.dart';
import 'package:flutter/material.dart';

class SearchTicketCard extends StatelessWidget {
  final SearchTicketEntity searchTicket;
  final int index;
  const SearchTicketCard(
      {super.key, required this.searchTicket, required this.index});

  @override
  Widget build(BuildContext context) {
    late Color color;
    switch (index) {
      case 0:
        color = Colors.red;
      case 1:
        color = AppColors.darkBlue;
      case 2:
        color = Colors.white;
    }
    return SizedBox(
      width: 296,
      height: 56,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(69),
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        searchTicket.title!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${searchTicket.price!.toString()} ₽",
                      style: TextStyle(
                          color: AppColors.blue, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blue,
                      size: 15,
                    )
                  ],
                ),
                Text(
                  searchTicket.timeRange!.join(" "),
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
