import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/app_export.dart';
import 'package:movieapp/core/presentation/pages/main_page.dart';
import 'package:movieapp/presentation/Ticket_tab_container_screen/ticket_tab_container_screen.dart';
import 'package:movieapp/presentation/home/home_screen.dart';
import 'package:movieapp/presentation/movie_details/movie_details_screen.dart';
import 'package:movieapp/presentation/mqtt/mqtt_screen.dart';
import 'package:movieapp/presentation/ticket_detials/ticket_details_screen.dart';

import '../../presentation/search/search_screen.dart';

const String homePath = "/home";
const String movieDetailPath = "movieDetails/:movieId";
const String searchPath = "search";

const String seatBookingPath = "seatBook";
const String seatBookingDetailsPath = "seatBookingDetails";

const String mqttPath = "mqtt_screen";

class AppRouter {
  GoRouter router = GoRouter(initialLocation: homePath, routes: [
    ShellRoute(
        builder: (context, state, child) => MainPage(
              child: child,
            ),
        routes: [
          GoRoute(
            name: AppRoutes.homeRoute,
            path: homePath,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: HomeScreen()),
            routes: [
              GoRoute(
                name: AppRoutes.movieDetailsRoute,
                path: movieDetailPath,
                pageBuilder: (_, state) => CupertinoPage(
                  child: MovieDetailScreen(
                      movieID: state.pathParameters['movieId']!),
                ),
              ),
              GoRoute(
                name: AppRoutes.searchRoute,
                path: searchPath,
                pageBuilder: (_, state) => CupertinoPage(child: SeachScreen()),
              ),
              GoRoute(
                name: AppRoutes.seatBookingRoute,
                path: seatBookingPath,
                pageBuilder: (_, state) =>
                    CupertinoPage(child: TicketTabContainerScreen()),
              ),
              GoRoute(
                name: AppRoutes.seatBookingDetailsRoute,
                path: seatBookingDetailsPath,
                pageBuilder: (_, state) =>
                    CupertinoPage(child: TicketDetailsScreen()),
              ),
              GoRoute(
                name: AppRoutes.mqttScreen,
                path: mqttPath,
                pageBuilder: (_, state) => CupertinoPage(child: MqttScreen()),
              ),
            ],
          ),
        ]),
  ]);
}
