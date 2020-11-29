// URL: https://github.com/DaidoujiChen/DaiLive2DPlayground


Live2D SDK : 2.0
Objective-C



* Live2DSDK Setting

1. Live2DResource with "Create folder references" import

2. Other with "Create groups" import






* Build Setting

3. Other Linker Flags -> " -lLive2D "

4. Library Search Paths
    (1) $(SRCROOT)/"your project name & path"/Live2DSDK/lib/$(CONFIGURATION)-$(PLATFORM_NAME)
    (2) Debug & Release same

5. User Header Search Paths
$(SRCROOT)/"your project name & path"/Live2DSDK/include

6. Preprocessor Macros
Debug & Releease add " L2D_TARGET_IPHONE "






* General Setting

7. Link Frameworks and Libraries add
    (1) GLKit.framework
    (2) OpenGLES.framework





* Code Setting
----------------------------------------------------------------------------------------
8. AppDelegate.mm // not .m
#import "Live2D.h"

using namespace live2d;

Live2D::init();
in
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
function

(this step not work is ok)
----------------------------------------------------------------------------------------


9. your main viewcontroller.h
UIView* glView;



10. your main viewcontroller.mm  // not .m
#import <QuartzCore/QuartzCore.h>
#import "HaruViewController.h"

@property (nonatomic, strong) DaiLive2DViewController *live2DViewController;
in
@interface MainVC ()

self.live2DViewController = [HaruViewController new];
self.live2DViewController.view.frame = self.view.bounds;
[self.view addSubview:self.live2DViewController.view];
in
- (void)viewDidLoad








=======================================================================================


touch action

* Live2DSDK Setting

1. Live2DFramework & OfficalLive2DTools with "Create groups" import





* General Setting

2. Linked Frameworks and Libraries 
 	CoreMotion.framework & AVFoundation.framework  add





* Code Setting

"your main viewcontroller".mm

3. #include "LAppLive2DManager.h"

4. @implementation MainVC {
       LAppLive2DManager *live2DMgr;
   }


5. in your viewDidLoad
live2DMgr = new LAppLive2DManager();
CGRect screen = [UIScreen mainScreen].bounds;
LAppView *view = live2DMgr->createView(screen);
live2DMgr->loadModel("Live2DResource/HaruFullPack/haru_02.model.json");
[self.view addSubview:view];

