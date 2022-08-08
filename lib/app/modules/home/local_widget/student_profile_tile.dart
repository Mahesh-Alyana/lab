import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class StudentProfileTile extends StatelessWidget {
  const StudentProfileTile({Key? key, required this.userDetails, this.color = Colors.white}) : super(key: key);
  final UserDetails userDetails;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimens.five),
      height: Dimens.seventy,
      width: Dimens.screenWidth,
      color: color,
      child: Row(
        children: [
          SizedBox(
            height: Dimens.seventy,
            width: Dimens.seventy,
            child: Center(
              child: CircleAvatar(
                radius: Dimens.thirty,
                backgroundColor: Colors.white,
                child: Icon(CupertinoIcons.person,size: Dimens.thirty,color: ColorsValue.primaryColor,)
            ),
          ),),
          Dimens.boxWidth20,
          SizedBox(
            height: Dimens.seventy,
            width: Dimens.screenWidth - Dimens.seventy-Dimens.twenty,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                          height: Dimens.seventy-0.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userDetails.firstName.isEmpty?'Profile not updated':'${userDetails.firstName} ${userDetails.lastName}',style: Styles.boldBlack18,),
                              Text(userDetails.email,style: Styles.black14,),
                              Text(userDetails.type.toUpperCase(),style: Styles.black14,),
                            ],
                          ),
                        )
                    ),
                    SizedBox(
                      height: Dimens.seventy-0.1,
                      width: Dimens.seventy-Dimens.twenty,
                      // child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(right: 8.0),
                      //       child: Text('2:45 PM',style: Styles.black14.copyWith(color:ColorsValue.darkBlue,fontWeight: FontWeight.w500,),),
                      //     ),
                      //     Dimens.boxHeight5,
                      //     Padding(
                      //       padding: const EdgeInsets.only(right:8.0),
                      //       child: CircleAvatar(
                      //         radius: 10,
                      //         backgroundColor: ColorsValue.primaryColor,
                      //         child: Center(child: Text('1',style: Styles.white10.copyWith(fontSize: 10),)),
                      //       ),
                      //     )
                      //   ],
                      // ),
                    )
                  ],
                ),
                // const Spacer(),
                Container(
                  height: 0.1,
                  width: Dimens.screenWidth - Dimens.seventy,
                  color: ColorsValue.darkBlue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
