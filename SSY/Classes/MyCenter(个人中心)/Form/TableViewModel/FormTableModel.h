//
//  FormTableModel.h
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,CreatedTableCellType) {
    CreateTableCell,//右侧+一个箭头
    CreateTableNormalCell,//只有一个TextField
    CreateTableTFCell,//左侧带Label的TextField
    CreateTableSeparatorCell,//空的
    CreateTableSelectCell,//右侧带有选择按钮的+带有箭头
    CreateTablePhotoCell,//右侧带有图片+带有箭头
    CreateTableTVCell,//只有一个TextView
    CreateTableButtonCell,//右侧带有按钮
    CreateTableSwitchCell,//右侧带有滑块按钮
    CreateTableCodeCell,//获取验证码
};

@interface FormTableModel : NSObject

//标题
@property(nonatomic,copy) NSString *title;
//提示文字
@property(nonatomic,copy) NSString *placeholder;

@property(nonatomic,copy) NSString *textVal;
//右侧选择文字
@property(nonatomic,copy) NSString *selectText;
//表单对应的字段
@property(nonatomic,copy) NSString *key;
//cell图片
@property(nonatomic,copy) NSString *imageName;
//滑动开关
@property(nonatomic,assign) BOOL switchState;
//最大长度
@property(nonatomic,assign) NSInteger maxLength;
//cell类型
@property(nonatomic,assign) CreatedTableCellType cellType;
//键盘类型
@property(nonatomic,assign) UIKeyboardType keyboardType;

//图片cell用到
@property(nonatomic,copy) NSString *imgURL;

@property(nonatomic,copy) void(^operationBlock)();



@end
