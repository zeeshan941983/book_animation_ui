import 'package:book_ui/components/book.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);
  void listener() {
    _notifierScroll.value = _controller.page!;
  }

  @override
  void initState() {
    _controller.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookheight = size.height * 0.45;
    final bookWidth = size.width * 0.7;
    return Scaffold(
      backgroundColor: Color(0xff28282B),
      body: SafeArea(
        child: Expanded(
          child: ValueListenableBuilder<double>(
            valueListenable: _notifierScroll,
            builder: (context, value, _) {
              return PageView.builder(
                controller: _controller,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  final percent = (index - value).abs();
                  final rotate = percent.clamp(0.0, 1.0);

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                height: bookheight,
                                width: bookWidth,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 20,
                                        offset: Offset(5.0, 5.0),
                                        spreadRadius: 10,
                                      ),
                                    ]),
                              ),
                              Transform(
                                alignment: Alignment.centerLeft,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.002)
                                  ..rotateY(1.2 * rotate)
                                  ..translate(-rotate * size.width * 0.8),
                                child: Image.asset(
                                  book.image,
                                  height: bookheight,
                                  width: bookWidth,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Opacity(
                          opacity: 1 - rotate,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "By ${book.author}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                books[index].price,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: const Size(200, 50)),
                            onPressed: () {},
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
