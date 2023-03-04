import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final double _prefferedHeight =56;
  const CustomAppBar(
      {Key? key,
      this.leadingIcon,
      this.leadingIconOnPress,
      this.title,
      this.subTitle,
      this.trailingIcon,
      this.trailingIconOnPress})
      : super(key: key);
  final IconData? leadingIcon;
  final String? title;
  final String? subTitle;
  final IconData? trailingIcon;
  final Function()? leadingIconOnPress;
  final Function()? trailingIconOnPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
          leading: (leadingIcon != null)?
            IconButton(onPressed: leadingIconOnPress, icon: Icon(leadingIcon)):const SizedBox(),
          title:Column(
            children: [
              if (title != null) Text(title!),
              if (subTitle != null) Text(subTitle!),
            ],
          ),
    actions: [
      trailingIcon != null
              ? IconButton(
                  onPressed: trailingIconOnPress,
                  icon: Icon(trailingIcon),
                )
              : const SizedBox()
    ],      
          
      
    
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}



/**
 * Container(
      height: 80,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          if (leadingIcon != null)
            IconButton(onPressed: leadingIconOnPress, icon: Icon(leadingIcon)),
          Column(
            children: [
              if (title != null) Text(title!),
              if (subTitle != null) Text(subTitle!),
            ],
          ),
          trailingIcon != null
              ? IconButton(
                  onPressed: trailingIconOnPress,
                  icon: Icon(trailingIcon),
                )
              : const SizedBox()
        ],
      ),
    );
 */