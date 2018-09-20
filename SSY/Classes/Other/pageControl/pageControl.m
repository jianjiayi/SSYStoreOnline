//
//  pageControl.m
//  SSY
//
//  Created by 大为科技 on 2018/7/24.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "pageControl.h"


@implementation pageControl





- (void) setCurrentPage:(NSInteger)currentPage {
    [super setCurrentPage:currentPage];
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        if (subviewIndex == currentPage){
            UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
            CGSize size;
            size.height = 8;
            size.width = 8;
            [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                         size.width,size.height)];
        }
    }
}


@end
