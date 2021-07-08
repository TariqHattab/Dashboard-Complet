import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/controllers/MenuController.dart';
import 'package:new_app/responsive.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(right: defualtPadding),
            child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: context.read<MenuController>().controlMenu),
          ),
        if (!Responsive.isMobile(context))
          Text(
            'Dashboard',
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        Expanded(
          child: SearchFeild(),
        ),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defualtPadding),
      padding: const EdgeInsets.symmetric(
          horizontal: defualtPadding, vertical: defualtPadding / 2),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white10),
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset('assets/images/profile_pic.png'),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Angilena Joli'),
            ),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}

class SearchFeild extends StatelessWidget {
  const SearchFeild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: new InputDecoration(
          hintText: 'Search',
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: defualtPadding / 2),
              padding:
                  const EdgeInsets.symmetric(horizontal: defualtPadding * .75),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
          )),
    );
  }
}
