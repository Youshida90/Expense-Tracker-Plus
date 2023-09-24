// ignore_for_file: file_names
// // ignore_for_file: file_names
// import 'package:expense_new_app/Pages/Analyticspage.dart';
// import 'package:expense_new_app/Pages/Balancepage.dart';
// import 'package:expense_new_app/Pages/Categoriespage.dart';
// import 'package:expense_new_app/Pages/Homepagecontent.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//       int selectedpages = 0;
//     void navigatepages(int index) {
//       setState(() {
//         selectedpages = index;
//       });
//     }
//   final List<Widget> pages = [
//     const Homepagecontent(),
//     const AnalyticsPage(),
//     const BalancePage(),
//     const CategoriesPage(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[selectedpages],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: selectedpages,
//         onTap: navigatepages,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.analytics,
//             ),
//             label: 'Analytics',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.balance,
//             ),
//             label: 'Balance',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.category,
//             ),
//             label: 'Categories',
//           ),
//         ],
//       ),
//     );
//   }
// }
