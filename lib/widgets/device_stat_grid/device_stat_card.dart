import 'package:flutter/material.dart';

class DeviceStatCard extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  const DeviceStatCard({Key? key,
    required this.child,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        child: Center(child: child)
      ),
    );
  }
}
