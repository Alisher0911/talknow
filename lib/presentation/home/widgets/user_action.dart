import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talknow/data/models/emoji_model.dart';
import 'package:visibility_detector/visibility_detector.dart';

class UserAction extends StatefulWidget {
  const UserAction({
    Key? key,
    required this.pageController,
    required this.emoji,
  }) : super(key: key);

  final PageController pageController;
  final Emoji emoji;

  @override
  State<UserAction> createState() => _UserActionState();
}

class _UserActionState extends State<UserAction> {
  late double opacity;
  bool isScrolledUp = false;

  @override
  void initState() {
    super.initState();
    opacity = widget.emoji.initialOpacity;
  }

  @override
  void didUpdateWidget(covariant UserAction oldWidget) {
    opacity = widget.emoji.initialOpacity;
    super.didUpdateWidget(oldWidget);
  }
  
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;    

    listen() {
      if (mounted) {
        if (widget.pageController.position.userScrollDirection == ScrollDirection.reverse) {
          if (widget.pageController.position.pixels % h <= 350) {
            setState(() {
              opacity = max(opacity, (widget.pageController.position.pixels % h) / 350);
            });
          } 
          // if (widget.pageController.position.pixels % h < h - 106) {
          //   setState(() {
          //     opacity = max(opacity, widget.pageController.position.pixels % h / (h - 106));
          //   });
          // }
        } else {
            setState(() {
              opacity = widget.emoji.initialOpacity;
            });
        }
      }
    }

    listen1() {
      if(mounted) {
        print(widget.pageController.position.pixels % h);
        if (widget.pageController.position.pixels % h <= 350) {
          setState(() {
            opacity = max(widget.emoji.initialOpacity, (widget.pageController.position.pixels % h) / 350);
          });
        } else {
          if(widget.pageController.position.userScrollDirection == ScrollDirection.forward) {
            setState(() {
              isScrolledUp = true;
            });
          } else {
            setState(() {
              isScrolledUp = false;
            });
          }
        }
      }
    }

    
    return VisibilityDetector(
      key: Key("${widget.key}"),
      onVisibilityChanged: (info) {
        double visibility = info.visibleFraction;
        if (visibility >= 0.9 ) {
          widget.pageController.addListener(listen1);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 166),
        child: Opacity(
          opacity: opacity,
          child: SvgPicture.asset(
            isScrolledUp? EmojiPath.rewind.name : widget.emoji.emojiName.name,
            height: 150,
            width: 150,
          ),
        ),
      )
        
    );
  }
}