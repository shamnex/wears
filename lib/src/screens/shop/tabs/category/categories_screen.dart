import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/models/category.dart';
import 'package:wears/src/widgets/image_container.dart';
import 'package:wears/src/widgets/main_title.dart';
import 'package:wears/src/widgets/sliver_app_bar.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  CategoriesScreenState createState() {
    return new CategoriesScreenState();
  }
}

class CategoriesScreenState extends State<CategoriesScreen> {
  final List<Category> _categories = Category.getAllCategories();

  @override
  Widget build(BuildContext context) {
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
                  child: SizedBox.fromSize(
                    child: Column(
                      children: <Widget>[
                        _buildGrid(context),
                      ],
                    ),
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
      ),
    );
  }

  Widget _buildGrid3(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: _categories.sublist(0, 2).map((category) {
                  return new _CategoryLink(
                    category: category,
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Row(
                children: _categories.sublist(2, 4).map((category) {
                  return new _CategoryLink(
                    category: category,
                  );
                }).toList(),
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
          children: _categories.map((category) {
            return new _CategoryLink(
              category: category,
            );
          }).toList(),
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
                  _CategoryLink(
                    category: _categories.first,
                  ),
                  Expanded(
                    child: Column(
                      children: _categories.sublist(1, 3).map((category) {
                        return new _CategoryLink(
                          category: category,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            new _CategoryLink(
              category: _categories.last,
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
                  _CategoryLink(
                    category: _categories.first,
                  ),
                  Expanded(
                    child: Column(
                      children: _categories.sublist(1, 4).map((category) {
                        return new _CategoryLink(
                          category: category,
                        );
                      }).toList(),
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

class _CategoryLink extends StatelessWidget {
  final Category category;
  final bool rotateTitle;
  const _CategoryLink({
    Key key,
    this.rotateTitle = false,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: "categeory/${category.title}",
            child: Material(
              child: WearsImageContainer(
                alignChild: Alignment.bottomLeft,
                size: Size.infinite,
                image: AssetImage(category.image),
                child: RotatedBox(
                  quarterTurns: rotateTitle ? -1 : 0,
                  child: WearsTitle(
                    text: category.title,
                  ),
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, "category/${category.title}");
        },
      ),
    );
  }
}
