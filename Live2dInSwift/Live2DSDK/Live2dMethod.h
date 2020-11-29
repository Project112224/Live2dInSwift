//
//  Live2dMethod.h
//  ttest
//
//  Created by 高杉君 on 2020/11/28.
//  Copyright © 2020 高杉君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Live2dMethod : NSObject

@property (nonatomic, assign) CGFloat previousScale;
@property (nonatomic, assign) BOOL isTouchOnMovingView;

- (void)initLive2d: (UIView *)_view;
- (void)onPitch:(UIPinchGestureRecognizer *)pinchGestureRecognizer;
- (CGPoint)getVCPosition;
- (void)setVCPosition: (CGPoint) _point;

@end
