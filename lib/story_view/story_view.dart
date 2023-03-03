import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewModel extends StatefulWidget {
  final List<String>? images;
  final bool? isAdmin;
  final Function(String)? swipCallBack;
  const StoryViewModel({
    Key? key,
    this.isAdmin = false,
    this.swipCallBack,
    this.images,
  }) : super(key: key);

  @override
  _StoryViewModelState createState() => _StoryViewModelState();
}

class _StoryViewModelState extends State<StoryViewModel>
    with SingleTickerProviderStateMixin {
  final StoryController controller = StoryController();
  bool? storyLoaded;
  int currentIndex = 0;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween(
      begin: const Offset(0.0, 0.5),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _controller,
      ),
    );
    super.initState();
  }

  late AnimationController _controller;
  late Animation<Offset> animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TextEditingController captionCon = TextEditingController();

  PageController pageController =
      PageController(initialPage: 0, keepPage: false);

  bool openSheet = false;
  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: StoryView(
                controller: controller,
                currentIndex: (int c) async {
                  print('currentIndex = $c');
                  currentIndex = c + 1;
                },
                storyItems: widget.images!.map((e) {
                  bool is_video = e.contains('.mp4') || e.contains('.MP4');
                  if (!is_video) {
                    return StoryItem.inlineImage(
                      url: "$e",
                      controller: controller,
                      imageFit: BoxFit.contain,
                      duration: Duration(seconds: 10),
                    );
                  } else {
                    return StoryItem.pageVideo(
                      '$e',
                      controller: controller,
                      caption: "",
                      duration: Duration(seconds: 10),
                    );
                  }
                }).toList(),
                onStoryShow: (s) {
                  print("Showing a story");
                },
                onComplete: () {
                  if (widget.images!.length == currentIndex + 1) {
                    Navigator.pop(context);
                  }
                },
                progressPosition: ProgressPosition.top,
                repeat: false,
                inline: true,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 65, left: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
