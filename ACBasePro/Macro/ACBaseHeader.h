//
//  ACBaseHeader.h
//  ACBasePro
//
//  Created by achaoacwang on 2023/6/26.
//

#ifndef ACBaseHeader_h
#define ACBaseHeader_h

#define weakdefine(VAR) __weak typeof(VAR) weak##VAR = VAR
//  gobal
#define ACDelegate ((AppDelegate*)[UIApplication sharedApplication].delegate)

// 颜色
#define NAVI_COLOR RGBCOLOR(249, 250, 251)      //navigationbar color
#define VC_COLOR RGBCOLOR(255, 255, 255)      //viewcontroller color
#define ZHUTI_COLOR RGBCOLOR(47, 123, 246)    //主题 color
#define MAIN_COLOR RGBCOLOR(0, 0, 0)      //主 color
#define SUB_COLOR RGBCOLOR(137, 137, 141)     //描述 color 89898D
#define ENABLE_COLOR RGBCOLOR(200, 200, 200)     //无法点击 color
#define ALERTBG_COLOR RGBACOLOR(0, 0, 0, 0.4)     //浮层背景 color

#endif /* ACBaseHeader_h */
