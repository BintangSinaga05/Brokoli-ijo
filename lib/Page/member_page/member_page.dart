import 'package:basic/Page/member_page/database_helper.dart';
import 'package:basic/Page/member_page/model.dart';
import 'package:flutter/material.dart';

class MembershipDetail extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onPurchase;

  const MembershipDetail({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
    required this.onPurchase,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: selected ? Colors.blue : Colors.white,
        child: Column(
          children: [
            ListTile(
              title: Text(
                title,
                style: TextStyle(color: selected ? Colors.white : Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: onPurchase,
              child: const Text("Beli Paket Member"),
            ),
          ],
        ),
      ),
    );
  }
}

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  String? selectedMembership;
  bool isPurchased = false; // Menyimpan status pembelian
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    loadMembershipData();
  }

  void loadMembershipData() async {
    List<MembershipDetailModel> memberships =
        await databaseHelper.getMemberships();

    // Misalnya, Anda dapat menetapkan selectedMembership berdasarkan data yang dimuat
    if (memberships.isNotEmpty) {
      setState(() {
        selectedMembership = memberships[0].title;
      });
    }
  }

  void purchaseMembership(String membershipTitle) async {
    // Simulasi pembelian
    DateTime now = DateTime.now();
    DateTime endDate =
        now.add(const Duration(days: 30)); // Contoh: Masa aktif 30 hari

    MembershipDetailModel membership = MembershipDetailModel(
      title: membershipTitle,
      currentStatus: "Active",
      startDate: now,
      endDate: endDate,
    );

    setState(() {
      isPurchased = true;
      startDate = now;
      this.endDate = endDate;
      selectedMembership = membershipTitle;
    });

    int membershipId = await databaseHelper.insertMembership(membership);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        decoration: const BoxDecoration(color: Colors.black87),
        child: Column(
          children: [
            // Content1
            Container(
              padding: const EdgeInsets.only(top: 15),
              height: 100,
              child: Row(
                children: [
                  const Column(
                    children: [
                      Text(
                        "Current Status",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Start Date",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "End Date",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  const Column(
                    children: [
                      Text(":", style: TextStyle(color: Colors.white)),
                      Text(":", style: TextStyle(color: Colors.white)),
                      Text(":", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    width: 144,
                  ),
                  Column(
                    children: [
                      Text(
                        isPurchased ? "Active" : "None",
                        style: TextStyle(
                            color: isPurchased ? Colors.green : Colors.white),
                      ), // Status aktif
                      Text(
                        isPurchased ? startDate!.toString().split(' ')[0] : "-",
                        style: TextStyle(
                            color: isPurchased ? Colors.green : Colors.white),
                      ), // Tanggal mulai
                      Text(
                        isPurchased ? endDate!.toString().split(' ')[0] : "-",
                        style: TextStyle(
                            color: isPurchased ? Colors.green : Colors.white),
                      ), // Tanggal berakhir
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Content2
            MembershipDetail(
              title: "Gold Membership",
              selected: selectedMembership == "Gold Membership",
              onTap: () {
                setState(() {
                  selectedMembership = "Gold Membership";
                });
              },
              onPurchase: () {
                purchaseMembership("Gold Membership");
              },
            ),
            MembershipDetail(
              title: "Silver Membership",
              selected: selectedMembership == "Silver Membership",
              onTap: () {
                setState(() {
                  selectedMembership = "Silver Membership";
                });
              },
              onPurchase: () {
                purchaseMembership("Silver Membership");
              },
            ),
            const SizedBox(
              height: 15,
            ),
            // Pilihan Paket Keanggotaan
          ],
        ),
      ),
    );
  }
}
