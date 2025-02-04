import 'package:covid_safe_app/controllers/authController/reg_controller.dart';
import 'package:covid_safe_app/widgets/AuthFormDatePicker.dart';
import 'package:covid_safe_app/widgets/AuthFormFiled.dart';
import 'package:covid_safe_app/widgets/AuthNumberPicker.dart';
import 'package:covid_safe_app/widgets/AuthToggleButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../routes/appPages.dart';
import '../../widgets/CustomButton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ScrollController scollBarController = ScrollController();
  final _registerController = Get.put(RegistrationController());

  @override
  void dispose() {
    Get.delete<RegistrationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      reverse: true,
      child: Obx(() {
        return Material(
            color: Colors.white,
            child: Container(
              height: _size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Created your account",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                      ),
                      child: CupertinoScrollbar(
                        child: ListView(
                          children: [
                            AuthFormFieldWidget(
                              size: _size,
                              icon: Icons.person,
                              hintText: "ID Number",
                              updateValue: (value) {
                                _registerController.nationalId.value = value;
                                _registerController.update();
                              },
                            ),
                            AuthFormFieldWidget(
                              size: _size,
                              icon: Icons.drive_file_rename_outline,
                              hintText: "Full Name",
                              textInputType: TextInputType.text,
                              updateValue: (value) {
                                _registerController.fullName.value = value;
                                _registerController.update();
                              },
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: AuthFormFieldWidget(
                                        textInputType: TextInputType.number,
                                        size: _size,
                                        icon: Icons.update,
                                        hintText: "Age",
                                        updateValue: (value) {
                                          _registerController.age.value = value;
                                          _registerController.update();
                                        }),
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: AuthToggleButtonWidget(
                                          size: _size,
                                          updateValue: (value) {
                                            _registerController.gender.value =
                                                value;
                                            _registerController.update();
                                          },
                                          data: ["Male", "Female"])),
                                ],
                              ),
                            ),
                            AuthFormFieldWidget(
                              size: _size,
                              icon: Icons.phone_android,
                              hintText: "Mobile No",
                              textInputType: TextInputType.datetime,
                              updateValue: (value) {
                                _registerController.mobileNumber.value = value;
                                _registerController.update();
                              },
                            ),
                            AuthFormFieldWidget(
                              size: _size,
                              setObscureText: true,
                              icon: Icons.remove_red_eye_outlined,
                              hintText: "Password",
                              textInputType: TextInputType.visiblePassword,
                              updateValue: (value) {
                                _registerController.password.value = value;
                                _registerController.update();
                              },
                            ),
                            AuthFormFieldWidget(
                              size: _size,
                              setObscureText: true,
                              icon: Icons.remove_red_eye_outlined,
                              hintText: "Confirm Password",
                              textInputType: TextInputType.visiblePassword,
                              updateValue: (value) {
                                _registerController.confirmPassword.value =
                                    value;
                                _registerController.update();
                              },
                            ),
                            Container(
                              child: SizedBox(
                                height: 80,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  _registerController.isRegistering.value
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircularProgressIndicator(
                                color: Colors.grey[900],
                              ),
                            ],
                          ),
                        )
                      : CustomNumphoricWidget(
                          onTap: () {
                            if (_registerController.confirmPassword ==
                                _registerController.password) {
                              _registerController.registerUser();
                            }
                          },
                        ),
                  Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("New User?",
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20)),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.Login);
                                        },
                                        child: Text(" Log In",
                                            style: TextStyle(
                                                color: Colors.yellow[900],
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ));
      }),
    );
  }
}
