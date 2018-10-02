import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/screens/shop/tabs/category/category_link.dart';
import 'package:wears/src/widgets/main_title.dart';
import 'package:wears/src/widgets/sliver_app_bar.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: WearsColors.background,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: _buildAppBar(),
            ),
          ];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: <Widget>[
                new SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverFillRemaining(
                    child:
                  SizedBox.fromSize(
                    child: Column(children: <Widget>[_buildGrid(context)]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverPersistentHeader(
        pinned: true,
        delegate: WearsSliverAppBar(
          color: WearsColors.background,
          expandedHeight: 80.0,
          collapsedHeight: 80.0,
          onScroll: (double offset) {},
          onScrollToTop: (bool isAtTop) {},
          bgImage: AssetImage(WearsImages.suit21),
          colapsedTitle: Text(
            "Home",
            style: TextStyle(
                fontFamily: 'Antonio',
                fontWeight: FontWeight.w900,
                fontSize: 22.0,
                color: WearsColors.primary),
          ),
          expandedTitle: null,
        ));
  }

  Widget _buildGrid3(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: "categeory/suits",
                        child: CategoryLink(
                          title: WearsTitle(
                            text: 'SUITS',
                            rotate: true,
                          ),
                          image: AssetImage(WearsImages.suit5),
                          onPressed: () {
                            Navigator.pushNamed(context, "/suits");
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CategoryLink(
                          title: WearsTitle(
                            text: 'WATCHES',
                            rotate: true,
                          ),
                          image: AssetImage(WearsImages.watch),
                          onPressed: () {},
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CategoryLink(
                              title: WearsTitle(
                                text: 'SHOES',
                                rotate: true,
                              ),
                              image: AssetImage(WearsImages.shoe),
                              onPressed: () {})),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryLink(
                          title: WearsTitle(
                            text: 'ACCESORIES',
                            rotate: true,
                          ),
                          image: AssetImage(WearsImages.tie),
                          onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid2(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryLink(
                  title: WearsTitle(text: 'SUITS'),
                  image: AssetImage(WearsImages.suit_bg),
                  onPressed: () {},
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryLink(
                    title: WearsTitle(text: 'WATCHES'),
                    image: AssetImage(WearsImages.watch),
                    onPressed: () {},
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CategoryLink(
                        title: WearsTitle(text: "SHOES"),
                        image: AssetImage(WearsImages.shoe),
                        onPressed: () {})),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryLink(
                    title: WearsTitle(
                      text: "ACCESORIES",
                    ),
                    image: AssetImage(WearsImages.tie),
                    onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid4(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryLink(
                        title: WearsTitle(text: 'Suits'),
                        image: AssetImage(WearsImages.suit_bg),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CategoryLink(
                              title: WearsTitle(text: 'WATCHES'),
                              image: AssetImage(WearsImages.watch),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CategoryLink(
                                    title: WearsTitle(text: 'SHOES'),
                                    image: AssetImage(WearsImages.shoe),
                                    onPressed: () {})),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryLink(
                    title: WearsTitle(text: 'ACCESORIES'),
                    image: AssetImage(WearsImages.tie),
                    onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: "category/suits",
                        child: Material(
                          child: CategoryLink(
                            textAlignment: Alignment.bottomLeft,
                            title: WearsTitle(text: 'SUITS'),
                            image: AssetImage(WearsImages.suit_bg),
                            onPressed: () {
                              Navigator.pushNamed(context, "category/suits");
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CategoryLink(
                              textAlignment: Alignment.bottomLeft,
                              title: WearsTitle(text: 'SUITS'),
                              image: AssetImage(WearsImages.watch),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CategoryLink(
                                    textAlignment: Alignment.bottomLeft,
                                    title: WearsTitle(text: 'SHOES'),
                                    image: AssetImage(WearsImages.shoe),
                                    onPressed: () {})),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CategoryLink(
                                textAlignment: Alignment.bottomLeft,
                                title: WearsTitle(text: 'ACCESORIES'),
                                image: AssetImage(WearsImages.tie),
                                onPressed: () {}),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
