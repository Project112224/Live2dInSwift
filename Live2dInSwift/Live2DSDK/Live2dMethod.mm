//
//  Live2dMethod.m
//  ttest
//
//  Created by 高杉君 on 2020/11/28.
//  Copyright © 2020 高杉君. All rights reserved.
//

#import "Live2dMethod.h"

#import <QuartzCore/QuartzCore.h>
#import "Live2D.h"
#import "HaruViewController.h"

// debug : 0 normal , 1 touch action
#define live2dMod 1

#if live2dMod == 1
    // touch  action
    #include "LAppLive2DManager.h"
#endif

@implementation Live2dMethod {
    #if live2dMod == 1
        // touch action
        LAppLive2DManager *live2DMgr;
        DaiLive2DViewController *live2DViewController;
    #endif
}


- (void)initLive2d: (UIView *)_view {
    #if live2dMod == 1
        // touch action
        live2DMgr = new LAppLive2DManager();
        CGRect screen = [UIScreen mainScreen].bounds;
        LAppView *view = live2DMgr->createView(screen);
        live2DMgr->loadModel("Live2DResource/hibiki/hibiki.model.json");
        [_view addSubview:view];
    #else
        self.live2DViewController = [HaruViewController new];
        self.live2DViewController.view.frame = self.view.bounds;
        [self.view addSubview:self.live2DViewController.view];
        [self setupGestures];
    #endif
}


- (void)onPitch:(UIPinchGestureRecognizer *)pinchGestureRecognizer {
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        self.previousScale = 1.0f;
        return;
    }
    
    CGFloat scale = 1.0f - (self.previousScale - pinchGestureRecognizer.scale);
    if (scale > 1.0) {
        self->live2DViewController.scale += 10;
    }
    else if (scale < 1.0) {
        self->live2DViewController.scale -= 10;
    }
    self.previousScale = pinchGestureRecognizer.scale;
}

- (CGPoint)getVCPosition {
    return self->live2DViewController.position;
}

- (void)setVCPosition: (CGPoint) _point {
    self->live2DViewController.position = _point;
}

@end
