import 'package:bwa_cozy/models/facility_models.dart';
import 'package:bwa_cozy/models/space_models.dart';
import 'package:bwa_cozy/pages/error_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/facility_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage({this.space});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isWishlist = true;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ErrorPage(),
            ));
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Image.network(
            widget.space.imageUrl,
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              SizedBox(
                height: 328,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                      text: '\$${widget.space.price}',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: ' / month',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16))
                                      ]),
                                )
                              ],
                            ),
                            Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                              return Container(
                                  child: Image.asset(
                                index <= widget.space.rating
                                    ? 'assets/icon_star.png'
                                    : 'assets/icon_star_grey.png',
                                width: 20,
                              ));
                            }).toList()
                                // [
                                //   Image.asset(
                                //     'assets/icon_star.png',
                                //     width: 20,
                                //   ),
                                //   SizedBox(
                                //     width: 2,
                                //   ),
                                //   Image.asset(
                                //     'assets/icon_star.png',
                                //     width: 20,
                                //   ),
                                //   SizedBox(
                                //     width: 2,
                                //   ),
                                //   Image.asset(
                                //     'assets/icon_star.png',
                                //     width: 20,
                                //   ),
                                //   SizedBox(
                                //     width: 2,
                                //   ),
                                //   Image.asset(
                                //     'assets/icon_star.png',
                                //     width: 20,
                                //   ),
                                //   SizedBox(
                                //     width: 2,
                                //   ),
                                //   Image.asset(
                                //     'assets/icon_star.png',
                                //     width: 20,
                                //     color: Color(0xff989BA1),
                                //   ),
                                // ],
                                )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              facility: Facility(
                                  id: 1,
                                  imageUrl: 'assets/icon_kitchen.png',
                                  title: 'Kitchen',
                                  total: widget.space.numberOfKitchens),
                            ),
                            FacilityItem(
                              facility: Facility(
                                  id: 2,
                                  imageUrl: 'assets/icon_bedroom.png',
                                  title: 'Bedroom',
                                  total: widget.space.numberOfBedrooms),
                            ),
                            FacilityItem(
                              facility: Facility(
                                  id: 3,
                                  imageUrl: 'assets/icon_cupboard.png',
                                  title: 'Big Lemari',
                                  total: widget.space.numberOfCupboards),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: PHOTOS
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.space.photos.map((item) {
                              return Container(
                                margin: EdgeInsets.only(left: edge),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList()

                            // [
                            //   SizedBox(
                            //     width: edge,
                            //   ),
                            //   Image.asset(
                            //     'assets/photo1.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(
                            //     width: 18,
                            //   ),
                            //   Image.asset(
                            //     'assets/photo2.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(
                            //     width: 18,
                            //   ),
                            //   Image.asset(
                            //     'assets/photo3.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(
                            //     width: 18,
                            //   ),
                            //   Image.asset(
                            //     'assets/photo4.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(
                            //     width: edge,
                            //   ),
                            // ],
                            ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge, bottom: 6),
                        child: Text(
                          "Location",
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.space.address}',
                                    style: greyTextStyle,
                                  ),
                                  Text(
                                    '${widget.space.city}',
                                    style: greyTextStyle,
                                  ),
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // launchUrl('https://goo.gl/maps/KdvruS2C7r5nmUHE8');
                                    launchUrl(widget.space.mapUrl);
                                  },
                                  child: Image.asset(
                                    'assets/btn_map.png',
                                    width: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: RaisedButton(
                          
                          //! membuat sebuah alert dialog sebelum pindah halaman page
                          //! belajar mengenai alert dialog link : https://api.flutter.dev/flutter/material/AlertDialog-class.html
                          onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: Text('Confirm'),
                                    content:
                                        Text('are you sure to call the owner?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cencel'),
                                          child: Text('Cencel')),
                                      TextButton(
                                          onPressed: () => Navigator.pop(
                                              context,
                                              launchUrl(
                                                  'tel:${widget.space.phone}')),
                                          child: Text('OK'))
                                    ],
                                  )),
                          //launchUrl('tel:${widget.space.phone}');
                          color: purpleColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/btn_back.png',
                    width: 40,
                  ),
                ),
                InkWell(
                  onTap: () {
                    //! belajar setState link: https://flutter.dev/docs/development/data-and-backend/state-mgmt/options
                    //! baca dan pahami dengan telitit step by stepnya
                    _clickWishlist();
                  },
                  child: Image.asset(
                    _isWishlist
                        ? 'assets/btn_wishlist.png'
                        : 'assets/btn_wishlist_isLike.png',
                    width: 40,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _clickWishlist() {
    setState(() {
      if (!_isWishlist) {
        _isWishlist = true;
      } else {
        _isWishlist = false;
      }
    });
  }
}
