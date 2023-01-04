import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartbin/providers/device_provider.dart';
import 'package:smartbin/widgets/app_page.dart';
import 'package:smartbin/widgets/custom_text.dart';
import 'package:smartbin/widgets/device_stat_grid/device_stat_grid.dart';

class DevicePage extends StatelessWidget {
const DevicePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    DeviceProvider deviceProvider = Provider.of<DeviceProvider>(context);
    String percentFull = "${deviceProvider.fullPercentage()}%";
    
    return AppPage(
      title: 'Device', 
      body: Center(
        child: Column(
          children: [
            CustomText(percentFull, size: 130),
            const CustomText('full', size: 30),
            const Expanded(child: DeviceStatGrid())
          ],
        ),
      )
    );
  }
}