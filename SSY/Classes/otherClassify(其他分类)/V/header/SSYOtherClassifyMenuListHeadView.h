//
//  SSYOtherClassifyMenuListHeadView.h
//  SSY
//
//  Created by 大为科技 on 2018/9/19.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SSYScrollMenu.h"

@interface SSYOtherClassifyMenuListHeadView : UICollectionReusableView<SSYScrollMenuDelegate>

@property(nonatomic,strong) SSYScrollMenu *scrollMenu;

@property(nonatomic,strong) NSMutableArray *menuArray;

@property(nonatomic,assign) CGRect menuFrame;

@end
