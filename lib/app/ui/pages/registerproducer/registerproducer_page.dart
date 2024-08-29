import 'package:app_pacharuna/app/controllers/registerproducer_controller.dart';
import 'package:app_pacharuna/app/ui/widgets/textfield_label.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterProducerPage extends GetView<RegisterProducerController> {
  const RegisterProducerPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: screenWidth,
            padding:
                const EdgeInsets.only(top: 20, right: 30, left: 30, bottom: 50),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/registro_pacharuna.png',
                      width: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Registro Productor",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color.fromARGB(255, 63, 63, 63)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Por favor regístrese para iniciar sesión!",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldLabel(
                            label: "Nombre",
                            icon: const Icon(Icons.abc),
                            hinText: "Ingrese su nombre",
                            controller: controller.name),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldLabel(
                            label: "Razón social (Opcional)",
                            icon: const Icon(Icons.business),
                            hinText: "Razón social de su empresa",
                            controller: controller.bussinesName),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldLabel(
                            label: "Documento",
                            hinText: "Ingrese DNI o RUC",
                            icon: const Icon(Icons.contact_emergency_outlined),
                            controller: controller.document),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldLabel(
                            label: "Telefono",
                            hinText: "Ingrese su telefono",
                            icon: const Icon(Icons.phone),
                            controller: controller.phone),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldLabel(
                            label: "Usuario",
                            hinText: "Ingrese un usuario",
                            icon: const Icon(Icons.person),
                            controller: controller.username),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Contraseña"),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => TextField(
                            controller: controller.password,
                            obscureText: controller.obscurePass.value,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.obscurePass.value =
                                      !controller.obscurePass.value;
                                },
                                child: Icon(
                                  controller.obscurePass.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              hintText: "Ingrese una contraseña",
                              filled: true,
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.registerProducer();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 55,
                            decoration: BoxDecoration(
                              color: GlobalColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Registrarse',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Ya tienes una cuenta?",
                              style: TextStyle(
                                color: GlobalColors.greyHard,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: GlobalColors.terciary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onTap: () {
                                Get.offAllNamed("/login");
                              },
                            ),
                          ],
                        ),
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
