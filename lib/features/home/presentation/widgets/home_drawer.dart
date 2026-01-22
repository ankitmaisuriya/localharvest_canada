import 'package:flutter/material.dart';
import 'package:localharvest_canada/config/routes/app_routes.dart';
import 'package:localharvest_canada/core/app_state/app_user.dart';
import 'package:localharvest_canada/features/home/presentation/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Read user from memory
    final user = AppUser.currentUser;
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF4CAF50)),
            accountName: Text(
              user?.full_name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(user?.email ?? ''),
            // currentAccountPicture: const CircleAvatar(
            //   backgroundImage: AssetImage('assets/images/top_banner.png'),
            // ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                user != null && user.full_name.isNotEmpty
                    ? user.full_name[0].toUpperCase()
                    : 'U',
                style: const TextStyle(fontSize: 24, color: Colors.green),
              ),
            ),
          ),
          _drawerItem(
            context,
            Icons.home,
            'Home',
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
          ),
          _drawerItem(
            context,
            Icons.person,
            'Profile',
            onTap: () {

            },
          ),
          _drawerItem(
            context,
            Icons.shopping_bag,
            'My Orders',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.myOrder);
            },
          ),
          _drawerItem(
            context,
            Icons.favorite,
            'Favorite Farms',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.favorite);
            },
          ),
          _drawerItem(
            context,
            Icons.message,
            'Messages',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.messages);
            },
          ),
          _drawerItem(
            context,
            Icons.settings,
            'Settings',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.setting);
            },
          ),
          _drawerItem(
            context,
            Icons.support,
            'Support',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.support);
            },
          ),
          const Spacer(),
          _drawerItem(
            context,
            Icons.logout,
            'Logout',
            color: Colors.red,
            onTap: () async {
              var sharedPreferences = await SharedPreferences.getInstance();
              await sharedPreferences.remove('userToken');
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title, {
    Color? color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
    );
  }
}
