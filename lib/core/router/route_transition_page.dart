import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRouteTransition {
  slideIn,
  slideOut,
}

CustomTransitionPage<void> buildRouteTransitionPage({
  required GoRouterState state,
  required Widget child,
  AppRouteTransition transition = AppRouteTransition.slideIn,
  bool slideOutAsUnderlay = true,
  Duration duration = const Duration(milliseconds: 350),
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return _RouteTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        duration: duration,
        transition: transition,
        slideOutAsUnderlay: slideOutAsUnderlay,
        child: child,
      );
    },
  );
}

class _RouteTransition extends StatelessWidget {
  const _RouteTransition({
    required this.animation,
    required this.secondaryAnimation,
    required this.duration,
    required this.transition,
    required this.slideOutAsUnderlay,
    required this.child,
  });

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Duration duration;
  final AppRouteTransition transition;
  final bool slideOutAsUnderlay;
  final Widget child;

  static const _slideCurve = Curves.easeInOutCubic;

  bool get _animate {
    return animation.status == AnimationStatus.forward ||
        animation.status == AnimationStatus.completed;
  }

  Animation<Offset> _horizontalSlide(Animation<double> controller, {required Offset begin, required Offset end}) {
    return Tween<Offset>(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: _slideCurve),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([animation, secondaryAnimation]),
      builder: (context, child) {
        return switch (transition) {
          AppRouteTransition.slideOut when slideOutAsUnderlay => SlideTransition(
            position: _horizontalSlide(
              secondaryAnimation,
              begin: Offset.zero,
              end: const Offset(-1, 0),
            ),
            child: FadeIn(
              animate: _animate,
              duration: duration,
              child: child!,
            ),
          ),
          AppRouteTransition.slideOut => SlideTransition(
            position: _horizontalSlide(
              animation,
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ),
            child: child!,
          ),
          AppRouteTransition.slideIn => SlideTransition(
            position: _horizontalSlide(
              animation,
              begin: const Offset(1, 0),
              end: Offset.zero,
            ),
            child: child!,
          ),
        };
      },
      child: child,
    );
  }
}
