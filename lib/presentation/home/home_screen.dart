import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rxdart/rxdart.dart';
import 'package:talknow/data/enums/app_icons.dart';
import 'package:talknow/data/enums/hobbies.dart';
import 'package:talknow/data/models/emoji_model.dart';
import 'package:talknow/data/models/user_model.dart';
import 'package:talknow/presentation/home/widgets/custom_appbar.dart';
import 'package:talknow/presentation/home/widgets/user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BehaviorSubject<Emoji> _subject = BehaviorSubject<Emoji>();
  Stream<Emoji> get stream => _subject.stream;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    User currentUser = User.users[0];

    return Scaffold(  
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // List of users
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            itemCount: User.users.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GestureDetector(
                  onDoubleTap: () {
                    _subject.add(Emoji(initialOpacity: 0.25, emojiName: EmojiPath.like));
                  },
                  child: UserCard(
                    user: User.users[index], 
                    pageController: _pageController, 
                    stream: stream,
                  ),
                )
              );
            },
            onPageChanged: (value) {
              currentUser = User.users[value];
              _subject.add(Emoji(initialOpacity: 0, emojiName: EmojiPath.dislike));
            },
          ),


          // Appbar
          const CustomAppbar(),

          
          // Hobbies
          Align(
            alignment: Alignment.bottomLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  height: 62,
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 56),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(35))
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppIcons.playbutton.name,
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 18),
                      _buildHobby(Hobbies.beer.name),
                      _buildHobby(Hobbies.dog.name),
                      _buildHobby(Hobbies.burger.name),
                      _buildHobby(Hobbies.headphones.name),
                      _buildHobby(Hobbies.game.name)
                    ],
                  ),
                ),
              ),
            ),
          ),


          // Actions
          Align(
            alignment: Alignment.bottomRight,
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 113),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      EmojiPath.instantMatch.name,
                      height: 50,
                      width: 50,
                    ),

                    const SizedBox(height: 10),


                    GestureDetector(
                      onTap: () {
                        _subject.add(Emoji(initialOpacity: 0.25, emojiName: EmojiPath.superlike));
                      },
                      child: SvgPicture.asset(
                        EmojiPath.superlike.name,
                        height: 50,
                        width: 50,
                      ),
                    ),

                    const SizedBox(height: 10),
                    
                    SvgPicture.asset(
                      EmojiPath.send.name,
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHobby(String assetName) {
    const double horizontalPadding = 194;
    const double hobbyCount = 5;
    final hobbySize = (MediaQuery.of(context).size.width - horizontalPadding) / hobbyCount;

    return Container(
      width: hobbySize,
      height: hobbySize,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE5E5E5)),
        borderRadius: const BorderRadius.all(Radius.circular(15))
      ),
      child: SvgPicture.asset(
        assetName,
        height: 30,
        width: 30,
      ),
    );
  }
}

