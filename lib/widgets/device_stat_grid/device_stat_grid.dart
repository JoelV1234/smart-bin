import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartbin/globals/config.dart';
import 'package:smartbin/providers/device_provider.dart';
import 'package:smartbin/widgets/device_stat_grid/device_stat_card.dart';
import 'package:url_launcher/url_launcher.dart';

class DeviceStatGrid extends StatelessWidget {
  const DeviceStatGrid({Key? key}) : super(key: key);

  void buyGarbageBags() async {
    if (await canLaunchUrl(garbageBagUrl)) {
      await launchUrl(garbageBagUrl);
    } else {
      throw "Could not launch $garbageBagUrl";
    }
  }

  @override
  Widget build(BuildContext context) {
    DeviceProvider deviceProvider = Provider.of<DeviceProvider>(context);
    String remainningHeight = 'Remainning height : ${deviceProvider.remainingHeight}m';
    String batteryPercent = 'Battery : ${deviceProvider.batteryPercentage}%';
    return GridView.count(
      padding: const EdgeInsets.all(10),
      childAspectRatio: 1.5,
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      children: [
        DeviceStatCard(child: Text(remainningHeight)),
        DeviceStatCard(
          onTap: buyGarbageBags,
          child: const Text('Buy garbage bag'),
        ),
        DeviceStatCard(child: Text(batteryPercent)),
        const DeviceStatCard(child: Text('Waste footprint')),
      ],
    );
  }
}
