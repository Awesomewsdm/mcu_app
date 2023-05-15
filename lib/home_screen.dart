import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mcu_app/colors.dart';
import 'images.dart';
import 'package:im_stepper/stepper.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        CarouselSlider(
            items: mcuImages
                .map(
                  (e) => Builder(builder: (context) {
                    return Image.asset(
                      e,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }),
                )
                .toList(),
            options: CarouselOptions(
              height: double.infinity,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RotatedBox(
                    quarterTurns: 90,
                    child: IconWidget(
                      icon: EvaIcons.menu2Outline,
                    ),
                  ),
                  Image.asset(
                    mcuLogo2,
                    width: 150,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                  const IconWidget(
                    icon: EvaIcons.search,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SPIDER-MAN: FAR FROM HOME",
                    style: TextStyle(
                        fontSize: 38,
                        color: whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconWidget(
                          icon: Ionicons.play_circle_outline,
                          iconSize: 65.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1h 49mins",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: whiteColor,
                                    fontWeight: FontWeight.normal),
                              ),
                              IconWidget(
                                icon: Ionicons.remove_outline,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(height: 250),
                items: mcuImages
                    .map((e) => Builder(builder: (context) {
                          return Image.asset(e);
                        }))
                    .toList(),
              ),
              const Text(
                "MARVEL CENEMATIC UNIVERSE",
                style: TextStyle(
                  fontSize: 15,
                  color: whiteColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              DotStepper(
                activeStep: 0,
                dotCount: mcuImages.length,
                spacing: 100,
                shape: Shape.circle,
                lineConnectorsEnabled: true,
                lineConnectorDecoration: const LineConnectorDecoration(
                  color: whiteColor,
                ),
                indicator: Indicator.worm,
                // indicatorDecoration: IndicatorDecoration(),
              ),
              const IconWidget(
                icon: EvaIcons.arrowIosDownwardOutline,
              ),
              const Text(
                "MORE ABOUT SPIDER-MAN",
                style: TextStyle(
                    fontSize: 15,
                    color: whiteColor,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

final List<String> mcuImages = [
  blackWidow,
  spiderManFarFromHome,
  spiderManFarFromHome2,
  doctorStrangeITMOM,
  doctorStrange,
];

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.icon,
    this.iconSize = 40.0,
  });

  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Icon(
      size: iconSize,
      icon,
      color: whiteColor,
    );
  }
}
