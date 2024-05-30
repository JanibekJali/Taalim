import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/presentation/names-of-allah/Cubit/SaveCubit/SaveCubit.dart';
import 'package:taalim/src/presentation/names-of-allah/Cubit/SubCubit/SubCubit.dart';
import 'package:taalim/src/presentation/names-of-allah/names_of_allah_text/names_of_allah_text_view.dart';

class NamesOfAllahView extends StatelessWidget {
  const NamesOfAllahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '99 Ысым',
          style: TextStyle(
              fontWeight: FontWeight.w700, color: Colors.blue, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SubCubit, List<bool>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return NamesOfAllahWidget(index: index);
            },
          );
        },
      ),
    );
  }
}

class NamesOfAllahWidget extends StatelessWidget {
  final int index;

  const NamesOfAllahWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SubCubit>(context);
    final cubitSave = BlocProvider.of<SaveCubit>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: screenWidth * 0.9,
          height:
              cubit.state[index] ? screenHeight * 0.35 : screenHeight * 0.085,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
            boxShadow: const [
              BoxShadow(
                color: Color(0x264A545C),
                blurRadius: 9,
                offset: Offset(0, 2),
                spreadRadius: 3,
              )
            ],
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: screenWidth * 0.05,
                    child: Center(
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          color: Color(0xFF8789A3),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          nameAllah[index],
                          style: TextStyle(
                            color: const Color(0xFF0099FF),
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          nameInKyrgyz[index],
                          style: TextStyle(
                            color: const Color(0xFF8789A3),
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          descriptionArabicText[index],
                          style: TextStyle(
                            color: const Color(0xFF0099FF),
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      BlocBuilder<SaveCubit, List<bool>>(
                        builder: (context, state) {
                          return IconButton(
                            icon: Icon(
                              cubitSave.state[index]
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              size: 25,
                              color: cubitSave.state[index]
                                  ? const Color(0xFF0099FF)
                                  : null,
                            ),
                            onPressed: () {
                              cubitSave.toggleBookmark(index);
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          cubit.state[index]
                              ? Icons.expand_less
                              : Icons.expand_more,
                          size: 30,
                        ),
                        onPressed: () {
                          cubit.toggleExpansion(index);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedCrossFade(
                firstChild: Container(),
                secondChild: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Text(
                    description[index],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: const Color(0xFF8789A3),
                      fontSize: screenHeight * 0.018,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                crossFadeState: cubit.state[index]
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
