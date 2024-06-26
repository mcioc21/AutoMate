import 'package:automate/homeOptions/servicesPage/appointment_options.dart';
import 'package:automate/homeOptions/servicesPage/choose_appointment_category.dart';
import 'package:automate/homeOptions/servicesPage/choose_discount.dart';
import 'package:automate/homeOptions/servicesPage/choose_partner.dart';
import 'package:automate/homeOptions/servicesPage/view_appointments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:automate/baseFiles/app_theme.dart';
import 'package:automate/homeOptions/servicesPage/choose_workshop.dart';
import 'package:automate/baseFiles/login_or_register.dart';
import 'package:automate/baseFiles/user_provider.dart';

class ServicesPage extends StatefulWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const ServicesPage({super.key, this.navigatorKey});

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    return Scaffold(
      body: user == null
          ? LoginOrRegisterPage(onLoginSuccess: () => {setState(() {
            // Refresh the page
          })})
          : Navigator(
              key: widget.navigatorKey,
              onGenerateInitialRoutes: (navigator, initialRoute) {
                return [
                  MaterialPageRoute(builder: (context) => _buildServiceButtons(context)),
                ];
              },
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case 'chooseWorkshop':
                    return MaterialPageRoute(
                        builder: (context) => const ChooseWorkshopPage());
                  case 'choosePartner':
                    return MaterialPageRoute(
                        builder: (context) => const PartnersPage());
                  case 'chooseDiscount':
                    return MaterialPageRoute(
                        builder: (context) => const DiscountsPage());
                  case 'viewAppointments':
                    return MaterialPageRoute(
                        builder: (context) => const ViewAppointmentsPage());
                  case 'makeAppointment':
                    return MaterialPageRoute(
                        builder: (context) => const ChooseAppointmentCategory());
                  default:
                    return MaterialPageRoute(
                        builder: (context) => _buildServiceButtons(context));
                }
              },
            ),
    );
  }

  Widget _buildServiceButtons(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildServiceButton(
              context: context,
              label: 'Workshops',
              description: 'Find and book workshops',
              icon: Icons.build,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChooseWorkshopPage(),
                ));
              },
            ),
            _buildServiceButton(
              context: context,
              label: 'Appointments',
              description: 'Manage your appointments',
              icon: Icons.calendar_today,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AppointmentsPage(),
                ));
              },
            ),
            _buildServiceButton(
              context: context,
              label: 'Partners',
              description: 'View our partners',
              icon: Icons.group,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PartnersPage(),
                ));
              },
            ),
            _buildServiceButton(
              context: context,
              label: 'Discounts',
              description: 'Check out discounts',
              icon: Icons.local_offer,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DiscountsPage(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceButton({
    required BuildContext context,
    required String label,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: AppColors.blue),
            const SizedBox(height: 10),
            Text(label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
