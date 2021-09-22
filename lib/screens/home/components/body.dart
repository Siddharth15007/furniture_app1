import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/screens/home/components/categories.dart';
import 'package:furniture_app/screens/home/components/recommand_products.dart';
import 'package:furniture_app/services/fetchCategories.dart';
import 'package:furniture_app/services/fetchProducts.dart';
import 'package:furniture_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(
              defaultSize * 2, //20
            ),
            child: TitleText(
              title: "Browse by Category",
            ),
          ),
          FutureBuilder(
            future: fetchCategroies(),
            builder: (context, snapshot) => snapshot.hasData
                ? Categories(
                    categories: snapshot.data,
                  )
                : Image.asset("assets/ripple.gif"),
          ),
          Divider(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(
              defaultSize * 2, //20
            ),
            child: TitleText(
              title: "Recommended For You",
            ),
          ),
          FutureBuilder(
            future: fetchProduct(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? RecommandProducts(
                      products: snapshot.data,
                    )
                  : Center(child: Image.asset("assets/ripple.gif"));
            },
          )
        ],
      ),
    );
  }
}
