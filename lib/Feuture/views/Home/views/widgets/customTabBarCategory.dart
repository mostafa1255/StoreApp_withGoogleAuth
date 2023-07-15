import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Feuture/Catigory_Cubit/category_cubit.dart';

class customTabBarCategory extends StatelessWidget {
  const customTabBarCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySucsess) {
          return DefaultTabController(
              length: state.Products.length,
              child: Column(
                children: [
                  Material(
                    child: Container(
                      height: 70,
                      color: Colors.white,
                      child: TabBar(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xffF8D9E0)),
                        tabs: [
                          Tab(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.white, width: 0)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  state.Products[0].toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.white, width: 0)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  state.Products[1],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.white, width: 0)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  state.Products[2],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.white, width: 0)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  state.Products[3],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        } else if (state is CategoryFaliure) {
          return const Text("There is no Category");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
