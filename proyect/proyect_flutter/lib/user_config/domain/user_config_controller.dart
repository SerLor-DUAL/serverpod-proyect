part of '../presentation/user_config.dart';

abstract class UserProfileConfigController extends State<UserProfileConfig> {
  
  // UPDATE USER PICTURE
  Future<void> updateUserPicture() async 
  {
    await showDialog(
        context: context,
        builder: (context) {
          return ProfilePictureSelector(
            userInfo: widget.userInfo,
            client: widget.client,
          );
        });
  }
  
  // TODO: FINISH THIS.
  Future<void> updateUserInfo() async{
    UserInfo newuserInfo = widget.userInfo;
  }


}
