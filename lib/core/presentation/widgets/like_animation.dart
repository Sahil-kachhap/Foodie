import 'package:flutter/material.dart';

class LikeAnimantion extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool smallLike;

  const LikeAnimantion(
      {required this.child,
      required this.isAnimating,
      this.duration = const Duration(milliseconds: 150),
      this.onEnd,
      this.smallLike = false,
      super.key});

  @override
  State<LikeAnimantion> createState() => _LikeAnimantionState();
}

class _LikeAnimantionState extends State<LikeAnimantion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scale;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2),
    );
    scale = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
    super.initState();
  }

  @override
  void didUpdateWidget (covariant LikeAnimantion oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if(widget.isAnimating != oldWidget.isAnimating){
      startAnimation();
    }
  }

  startAnimation() async{
    if(widget.isAnimating || widget.smallLike){
      await _controller.forward();
      await _controller.reverse();
      await Future.delayed(const Duration(milliseconds: 200,),);

      if(widget.onEnd != null){
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: widget.child,
    );
  }
}
