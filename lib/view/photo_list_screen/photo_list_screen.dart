import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';

import '../../Di/di.dart';
import '../../core/providers/SettingProviders.dart';
import '../../core/utils/ToggleTheme.dart';
import '../photo_list_screen/photo_list_cubit.dart';
import '../photo_list_screen/photo_list_state.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});
  static const String routeName = "PhotoListScreen";

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  late PhotoListCubit cubit;
  bool isOnline = true;

  @override
  void initState() {
    super.initState();
    cubit = getIt<PhotoListCubit>();
    checkInitialConnectivity();
    cubit.loadPhotos();

    // Listen to connectivity changes
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      final status = result != ConnectivityResult.none;
      if (status != isOnline) {
        setState(() => isOnline = status);
        if (status) cubit.loadPhotos(); // refresh if online again
      }
    });
  }

  Future<void> checkInitialConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    final status = result != ConnectivityResult.none;
    setState(() {
      isOnline = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var settingProviders = Provider.of<SettingProviders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            settingProviders.themeMode == ThemeMode.dark
                ? Image.asset('assets/images/logo_dark.png', height: height * .06)
                : Image.asset('assets/images/logo_light.png', height: height * .06),
            ToggleTheme(),
          ],
        ),
      ),
      body: Column(
        children: [
          if (!isOnline)
            Container(
              width: double.infinity,
              color: Colors.red,
              padding: const EdgeInsets.all(8),
              child: const Text(
                'You are offline',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          Expanded(
            child: BlocBuilder<PhotoListCubit, PhotoListState>(
              bloc: cubit,
              builder: (context, state) {
                if (state is PhotoListLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PhotoListError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is PhotoListLoaded) {
                  final photos = state.photos;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: photos.length,
                      itemBuilder: (context, index) {
                        final photo = photos[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: photo.src.portrait,
                            fit: BoxFit.cover,
                            placeholder: (ctx, url) => Container(
                              color: Colors.grey[300],
                            ),
                            errorWidget: (ctx, url, err) => const Icon(Icons.error),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
