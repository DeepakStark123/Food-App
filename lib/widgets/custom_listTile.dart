// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onTap,
  });
  final String title;
  final IconData leadingIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      leading: Icon(leadingIcon),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}