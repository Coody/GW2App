//
//  Tools.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/29.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface GW2BroH_Tools : NSObject

/**
 * @brief - 取得 image 的本地端路徑
 * @param - tempClass: 取得 image view 得 viewcontroller 名稱（通常只要輸入 [ViewControllerOOXX class] 就好）
 * @param - tempImageName: image 的名稱（不帶 .png ）
 */
+(NSString *)getPathWithClass:(id)tempClass
                withImageName:(NSString *)tempImageName;

/***/
+(UIImage *)getImageWithClass:(id)tempClass
                withImageName:(NSString *)tempImageName;

/***/
+(NSString *)getPathWithString:(NSString*)tempString
                 withImageName:(NSString *)tempImageName;

/***/
+(UIImage *)getImageWithString:(NSString*)tempString
                 withImageName:(NSString *)tempImageName;

/***/
+(NSString *)getPathWithString:(NSString*)tempString
                  withFileName:(NSString *)tempFileName
                      withType:(NSString *)tempType;

/***/
+(float) statusBarHeight;

@end
