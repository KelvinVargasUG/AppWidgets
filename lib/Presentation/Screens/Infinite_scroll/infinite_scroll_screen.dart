import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = "infinite_scroll_screen";
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesid = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {
      moveScrollToBotton();
    });
  }

  void addFiveImages() {
    final lastId = imagesid.last;
    imagesid.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future<void> onRefres() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;
    isLoading = false;
    final lastId = imagesid.last;
    imagesid.clear();
    imagesid.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void moveScrollToBotton() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: RefreshIndicator(
            edgeOffset: 10,
            strokeWidth: 2,
            onRefresh: onRefres,
            child: ListView.builder(
              controller: scrollController,
              itemCount: imagesid.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder: const AssetImage(
                      'assets/images/cupertino_activity_indicator.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesid[index]}/500/300'),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pop();
            },
            child: isLoading
                ? FadeInRight(
                    duration: const Duration(milliseconds: 250),
                    child: SpinPerfect(
                        infinite: true,
                        child: const Icon(Icons.refresh_rounded)),
                  )
                : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded))));
  }
}
