import 'package:basic/Provider/Provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  const AppBarScreen({super.key, Key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  DateTime getInitialDate(ProviderTugas2 provTugas2) {
    // You can return the initial date based on your logic here.
    // For example, return the date from provTugas2 if available, or DateTime.now() as a fallback.
    return provTugas2.dataCurrentdate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final provTugas2 = context.watch<ProviderTugas2>();
    var date = provTugas2.dataCurrentdate;
    var dateFormat = DateFormat("EEEE, dd MMMM yyyy").format(date);

    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarHeight: 70,
      backgroundColor: const Color(0xffb28242c),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Halo ${provTugas2.username}!",
            style: const TextStyle(color: Colors.white38, fontSize: 18),
          ),
          Text(
            dateFormat,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () async {
            var initialDate =
                getInitialDate(provTugas2); // Get the initial date.
            var res = await showDatePicker(
              context: context,
              initialDate: initialDate, // Use the initial date.
              firstDate: DateTime(2000),
              lastDate: DateTime(2500),
            );

            if (res != null) {
              provTugas2.setdate = res;
            }
          },
          icon: const Icon(
            Icons.date_range,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
