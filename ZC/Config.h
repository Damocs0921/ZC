//
//  Config.h
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#ifndef ZC_Config_h
#define ZC_Config_h


//颜色
#define THEME_BLUE [UIColor colorWithRed:133 / 255.0 green:187 / 255.0 blue:244 / 255.0 alpha:1.0]
#define CUSTOM_ORANGE [UIColor orangeColor]
#define BACKGROUND_COLOR [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1.0]
#define DEVIDE_LINE_COLOR [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:0.5]


//尺寸
#define LINE_HEIGHT 1.0/[UIScreen mainScreen].scale

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height //屏幕完整高度
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width   //屏幕完整宽度
#define ScreenFrameHeight [UIScreen mainScreen].applicationFrame.size.height //去掉状态栏的屏幕高度

//key
#define BMOB_APP_ID @"0d727030e5c81580721bb41eb17c5e62"
#define BMOB_TEST_API @"d8d35eca3b35d6ee83f3d999f21503e6"
#define BMOB_MASTER_KEY @"5d84215e3f52a0798102ef6b877cc95a"
#define BMOB_ACCESS_KEY @"13cfcb13e11a1114cf264da4ab30588e"
#define BMOB_SEC_KEY @"23229c69df780f96"


#define BEE_APP_ID @"d3ff1076-6ea4-45be-996c-04362f2c877c"
#define BEE_SECRET @"5bff3de0-3a03-42c0-a9c6-ae0e1e482d51"

#endif
