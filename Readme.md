# Live2d on Swift

編寫日期：2020/11/29

建置版本:
- Xcode 版本: 11.6
- OS: Mac catalina
- IOS: 13.6

原著作：https://github.com/DaidoujiChen/DaiLive2DPlayground

套用他的做法去延續的

首先在 [這裡](https://drive.google.com/file/d/1vCwgwgv78u3U66thNA7VoGjdOdGiT7lV/view?usp=sharing) 載SDK下來後

1. 加入專案裡, 注意 `Live2DResource` 這個檔案要用 reference 方式加入(總之就是資料夾要是藍色的啦)
![](https://i.imgur.com/cbiqzKw.png)

2. 設置 Xcode

- 首先設置 `User Header Search Paths`
加上
`$(SRCROOT)/$(PRODUCT_NAME)/Live2DSDK/include`

<span style="color: #E1E100;">路徑以 `Live2dInSwift` 的路徑做比對</span>

- 設置 `Library Search Paths`
加上
`$(SRCROOT)/$(PRODUCT_NAME)/Live2DSDK/lib`

- `Valid Architectures`
加上
`$(ARCHS_STANDARD)`
如果有重複的可以砍了那個重複的沒問題

- `Other Linker Flags` 加上 `-lLive2D`
讓 C 的編譯器吃到

- 在 `Preprocessor Macros`
各別加上
`L2D_TARGET_IPHONE`
不要蓋掉原本的

- 最後加上 `Objective-C Bridging Header`
`$(SRCROOT)/$(PRODUCT_NAME)/Live2DSDK/Header-live2dB.h`

3. 加入 OpenGL 需要的 pkg
`OpenGLES`、`GLKit`、`CoreMotion`、`AVFoundation`
![](https://i.imgur.com/KupWeQ5.png)

4. Xcode 設置完之後 run 看看 (或 build)
應該不會有錯誤...對！就是也不會有任何東西

5. 在加一點 code
```
import UIKit

class ViewController: UIViewController {

    let live2d = Live2dMethod()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.live2d.initLive2d(self.view)
        
        let pinchGestureRecognizer: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.live2d.onPitch(_:)))
        self.view.addGestureRecognizer(pinchGestureRecognizer)
    }

}
```

6. 最後
![](https://i.imgur.com/BQ8dVoy.png)
