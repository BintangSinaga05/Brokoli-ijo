import 'package:basic/Provider/Provider.dart';
import 'package:basic/style/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppBarScreen extends StatefulWidget implements PreferredSizeWidget {
  const AppBarScreen({Key? key}) : super(key: key);

  @override
  _AppBarScreenState createState() => _AppBarScreenState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarScreenState extends State<AppBarScreen> {
  late DateTime selectedDate; // Tambahkan variabel selectedDate

  @override
  void initState() {
    super.initState();
    selectedDate =
        DateTime.now(); // Inisialisasi selectedDate ke DateTime.now()
  }

  @override
  Widget build(BuildContext context) {
    final provTugas2 = context.watch<ProviderTugas2>();
    var date = provTugas2.dataCurrentdate;
    var dateFormat = DateFormat("EEEE, dd MMMM yyyy").format(date);

    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarHeight: 70,
      backgroundColor: appbarcolor,
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
            var res = await showDatePicker(
              context: context,
              initialDate: selectedDate, // Gunakan selectedDate
              firstDate: DateTime(2000),
              lastDate: DateTime(2500),
            );

            if (res != null) {
              setState(() {
                selectedDate = res; // Perbarui selectedDate
                provTugas2.setdate = res;
              });
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
