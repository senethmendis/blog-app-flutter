import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/auth_provider.dart';

class UserDetailCard extends StatelessWidget {
  const UserDetailCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            width: 80,
            //https://pbs.twimg.com/media/F2zmJFAWUAAvAfb?format=jpg&name=large
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        Provider.of<AuthProviders>(context).userModel!.image),
                    fit: BoxFit.cover),
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPoppingText(
                  text: Provider.of<AuthProviders>(context).userModel!.name,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                SizedBox(
                  width: 172,
                  height: 50,
                  child: Text(
                    Provider.of<AuthProviders>(context).userModel!.email,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
