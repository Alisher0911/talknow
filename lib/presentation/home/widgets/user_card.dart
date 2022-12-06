import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talknow/data/models/emoji_model.dart';
import 'package:talknow/data/models/user_model.dart';
import 'package:talknow/presentation/home/widgets/user_action.dart';

class UserCard extends StatefulWidget {
  final User user;
  final PageController pageController;
  final Stream<Emoji> stream;

  const UserCard({
    super.key,
    required this.user,
    required this.pageController,
    required this.stream
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  int currentPageValue = 0;
  late PageController _imageController;

  @override
  void initState() {
    super.initState();
    _imageController = PageController(initialPage: currentPageValue);
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Emoji>(
      initialData: Emoji(initialOpacity: 0, emojiName: EmojiPath.dislike),
      stream: widget.stream,
      builder: (context, snapshot) {
        return Stack(
          children: [
            // images
            PageView.builder(
              controller: _imageController,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.user.imageURLs.length,
              itemBuilder:(context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                      widget.user.imageURLs[index],
                      fit: BoxFit.cover,
                    ),
                );
              },
              onPageChanged: (value) {
                setState(() {
                  currentPageValue = value;
                });
              },
            ),

            
            // Top linear gradient
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 230,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent
                    ],
                  )
                ),
              ),
            ),


            // Bottom linear gradient
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 136,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7)
                    ],
                  )
                ),
              ),
            ),
        
        
            // User information
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(18, 66, 18, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.user.name}, ${widget.user.age}", 
                            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white)
                          ),
                          
                          IconButton(
                            onPressed: () {
                              _showButtons(context);
                            },
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                              size: 30,
                            )
                          ),
                        ],
                      ),
                      
                      Text(
                        "${widget.user.city}, ${widget.user.distance} km", 
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white)
                      ),
                    ],
                  ),
                ),
              )
            ),
        
            // Image scroll indicator
            widget.user.imageURLs.length == 1 
            ? Container()
            : Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 72),
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < widget.user.imageURLs.length; i++)
                        if (i == currentPageValue) ...[_lineBar(true)] else
                          _lineBar(false),
                    ],
                  ),
                ),
              ),
            ),
        

            // Actions
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: UserAction(
                  pageController: widget.pageController, 
                  emoji: snapshot.data!,
                ),
              ),
            ),
          ]
        );
      }
    );
  }


  _showButtons(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("First Action pressed")
                  )
                );
              },
              child: const Text("First Action",)
            ),

            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Second Action pressed")
                  )
                );
              },
              child: const Text("Second Action")
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            isDefaultAction: true,
            child: const Text("Cancel",)
          ),
        );
      }
    );
  }


  Widget _lineBar(bool isActive) {
    int itemCount = widget.user.imageURLs.length;
    const double indicatorWidgetHorizontalPadding = 84;
    const double itemHorizontalPadding = 10;
    final double w = (MediaQuery.of(context).size.width - indicatorWidgetHorizontalPadding - itemHorizontalPadding * itemCount) / itemCount;

    return Container(
      height: 2,
      width: w,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: isActive ? Colors.white : Colors.white.withOpacity(0.44),
    );
  }
}




