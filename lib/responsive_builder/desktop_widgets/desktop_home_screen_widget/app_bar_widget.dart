import 'package:abi/custom_widgets/loading_widget.dart';
import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/detail_form.dart';
import 'package:flutter/material.dart';

import '../../../custom_widgets/pageroute_animation_widget.dart';
import '../../../screens/about_screen/about_screen.dart';
import '../../../screens/auth screens/auuth_screen.dart';
import '../../../screens/contact_screen/contact_screen.dart';
import '../../../screens/home_screen.dart';
import '../../../screens/service screen/service_screen.dart';
import 'search_bar_widget.dart';

AppBar desktopAppBar(BuildContext context) => AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.dehaze_sharp)),
      title: const Text(
        'Alphacentauric Business Intelligence ',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Businesses',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Services',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (context) {
            //         return const ServiceScreen();
            //       }));
            //     },
            //     child: const Row(
            //       children: [
            //         Text(
            //           'Categories',
            //           style: TextStyle(fontSize: 14.5, color: Colors.black),
            //         ),
            //         Icon(Icons.arrow_drop_down)
            //       ],
            //     )),
            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (context) {
            //         return const ServiceScreen();
            //       }));
            //     },
            //     child: const Row(
            //       children: [
            //         Text(
            //           'Management',
            //           style: TextStyle(fontSize: 14.5, color: Colors.black),
            //         ),
            //         Icon(Icons.arrow_drop_down)
            //       ],
            //     )),
            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (context) {
            //         return const ServiceScreen();
            //       }));
            //     },
            //     child: const Row(
            //       children: [
            //         Text(
            //           'Analyst Report',
            //           style: TextStyle(fontSize: 14.5, color: Colors.black),
            //         ),
            //         Icon(Icons.arrow_drop_down)
            //       ],
            //     )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Implementation Guide',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const AboutScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'About',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Blogs',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'FAQs',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ContactScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (context) {
            //         return const ServiceScreen();
            //       }));
            //     },
            //     child: const Row(
            //       children: [
            //         Text(
            //           'Support',
            //           style: TextStyle(fontSize: 14.5, color: Colors.black),
            //         ),
            //         Icon(Icons.arrow_drop_down)
            //       ],
            //     )),
            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (context) {
            //         return const HomePage();
            //       }));
            //     },
            //     child: const Row(
            //       children: [
            //         Text(
            //           'Help',
            //           style: TextStyle(fontSize: 14.5, color: Colors.black),
            //         ),
            //         Icon(Icons.arrow_drop_down)
            //       ],
            //     )),
          ],
        ),
      ),
      actions: [
        SearchWidget(),
        const SizedBox(
          width: 40,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
            child: const Row(
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'My Account',
                  style: TextStyle(fontSize: 14.5, color: Colors.black),
                ),
              ],
            )),
        const SizedBox(
          width: 40,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AuthScreen();
              }));
            },
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 14.5, color: Colors.black),
            )),
        IconButton(
          onPressed: () {
            // Show search bar
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            // Handle popup menu selection
          },
          itemBuilder: (context) {
            return ['Profile', 'Contact Us'].map((String option) {
              return PopupMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList();
          },
        ),
      ],
    );

AppBar desktopAppBarOpen(BuildContext context) => AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.dehaze_sharp)),
      title: const Text(
        'Alphacentauric Business Intelligence ',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                AnimatedPageTransition(
                  destinationPage: HomePage(),
                ),
              );
            },
            child: const Text(
              'Home',
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            )),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  AnimatedPageTransition(destinationPage: ServiceScreen()));
            },
            child: const Text(
              'Services',
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            )),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return AboutScreen();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutQuart;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                ),
              );
            },
            child: const Text(
              'About',
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            )),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return ContactScreen();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutQuart;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                ),
              );
            },
            child: const Text(
              'Contact',
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            )),
        ElevatedButton(
            onPressed: () {
              LoadAndNavigateWidget.showLoadingAndNavigate(
                context,
                BusinessOwnerForm(isLogin: false),
              );
            },
            child: const Text(
              'Log In',
              style: TextStyle(fontSize: 15.5, color: Colors.black),
            )),
        PopupMenuButton<String>(
          onSelected: (value) {
            // Handle popup menu selection
          },
          itemBuilder: (BuildContext context) {
            return ['Profile', 'Contact Us'].map((String option) {
              return PopupMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList();
          },
        ),
      ],
    );
