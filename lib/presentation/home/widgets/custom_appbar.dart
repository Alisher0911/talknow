import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talknow/data/enums/app_icons.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 0, 33, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.logo.name,
                    height: 46,
                    width: 46,
                  ),

                  const SizedBox(width: 10),

                  SvgPicture.asset(
                    AppIcons.date.name,
                    height: 20,
                    width: 48,
                  ),
                ],
              ),
              
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.loud.name,
                    height: 32,
                    width: 32,
                  ),

                  const SizedBox(width: 10),

                  SvgPicture.asset(
                    AppIcons.nomessages.name,
                    height: 32,
                    width: 32,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}