import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../Bintang/Provider/Provider.dart';
import '../../Reza/profile_page.dart';

class ScheduleAppBar extends StatelessWidget {
  const ScheduleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provTugas2 = context.watch<ProviderTugas2>();
    var date = provTugas2.dataCurrentdate;
    var dateFormat = DateFormat.yMMMEd().format(date);
    return ListTile(
      leading: IconButton(
        icon: Image.network(
          "https://cdn-icons-png.flaticon.com/128/2202/2202112.png",
        ),
        iconSize: 50,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
        },
      ),
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo ${provTugas2.username}!",
              style: const TextStyle(color: Colors.white38),
            ),
            Text(
              dateFormat,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
      trailing: IconButton(
          onPressed: () async {
            var res = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2000),
                lastDate: DateTime(2500));

            if (res != null) {
              provTugas2.setdate = res;
            }
          },
          icon: const Icon(
            Icons.date_range,
            color: Colors.white,
          )),
    );
  }
}
