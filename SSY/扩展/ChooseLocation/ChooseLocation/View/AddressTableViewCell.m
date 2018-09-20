//
//  AddressTableViewCell.m
//  ChooseLocation
//
//  Created by Sekorm on 16/8/26.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "AddressTableViewCell.h"
#import "AddressItem.h"

@interface AddressTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *selectFlag;
@end
@implementation AddressTableViewCell



#pragma mark - 赋值
- (void)setItem:(AddressItem *)item{
    
    _item = item;
    _addressLabel.text = item.name;
    _addressLabel.textColor = item.isSelected ? [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0] : [UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0] ;
    _selectFlag.hidden = !item.isSelected;
}


@end
