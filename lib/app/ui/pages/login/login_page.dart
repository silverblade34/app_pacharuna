import 'package:app_pacharuna/app/controllers/login_controller.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fondo_login.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                height: screenHeight * 0.65,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(197, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/campesino_login.png',
                      width: 60,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Hola de nuevo!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color.fromARGB(255, 63, 63, 63)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Ingrese sus credenciales",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Usuario"),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.username,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Contraseña"),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.password,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.validateUser();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 55,
                            decoration: BoxDecoration(
                              color: GlobalColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Ingresar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
