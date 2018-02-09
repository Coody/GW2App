//
//  Constants.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/31.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#ifndef GW2BroH_Constants_h
#define GW2BroH_Constants_h

#pragma mark - Enum
typedef enum : int{
    EnumTabBarIndexStartMenu = 0,
    EnumTabBarIndexWorldBoss = 10,
    EnumTabBarIndexItems = 11,
    EnumTabBarIndexDungeons = 12,
    EnumTabBarIndexGuild = 13,
    EnumTabBarIndexMore = 14
}EnumTabBarIndex;


#define mark - Define

#define VC_START_MENU_BACKGROUND_COLOR [UIColor colorWithRed:0.36 green:0.47 blue:0.66 alpha:1.0f]
#define VC_OTHERS_BACKGROUND_COLOR [UIColor colorWithRed:0.91f green:0.95f blue:1.0f alpha:1.0f]
#define VC_NAVIGATION_BAR_COLOR [UIColor colorWithRed:0.1f green:0.35f blue:0.63f alpha:1.0f]

#define FRAME_SIZE(TEXT,FONT) [(TEXT) boundingRectWithSize: CGSizeMake( CGFLOAT_MAX, CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: FONT} context: nil].size
#define FRAME_SIZE_WITH_WIDTH(WIDTH,TEXT,FONT) [(TEXT) boundingRectWithSize: CGSizeMake( WIDTH , CGFLOAT_MAX ) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: FONT} context: nil].size

#define D_Default_Font_Name @"Helvetica Neue"


/*************************** Dynamic property for Category ***************************/
#define CATEGORY_PROPERTY_GET(type, property)\
- (type) property {\
    return objc_getAssociatedObject(self, @selector(property));\
}

#define CATEGORY_PROPERTY_SET(type, property, setter)\
- (void) setter (type) property {\
    objc_setAssociatedObject(self, @selector(property), property, OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

#define CATEGORY_PROPERTY_GET_SET(type, property, setter)\
    CATEGORY_PROPERTY_GET(type, property)\
    CATEGORY_PROPERTY_SET(type, property, setter)



#define CATEGORY_PROPERTY_GET_NSNUMBER_PRIMITIVE(type, property, valueSelector)\
- (type) property {\
    return [objc_getAssociatedObject(self, @selector(property)) valueSelector];\
}

#define CATEGORY_PROPERTY_SET_NSNUMBER_PRIMITIVE(type, property, setter, numberSelector)\
- (void) setter (type) property {\
    objc_setAssociatedObject(self, @selector(property), [NSNumber numberSelector: property], OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}


#define CATEGORY_PROPERTY_GET_UINT(property)\
CATEGORY_PROPERTY_GET_NSNUMBER_PRIMITIVE(unsigned int, property, unsignedIntValue)

#define CATEGORY_PROPERTY_SET_UINT(property, setter)\
CATEGORY_PROPERTY_SET_NSNUMBER_PRIMITIVE(unsigned int, property, setter, numberWithUnsignedInt)

#define CATEGORY_PROPERTY_GET_SET_UINT(property, setter)\
CATEGORY_PROPERTY_GET_UINT(property)\
CATEGORY_PROPERTY_SET_UINT(property, setter)


#endif
