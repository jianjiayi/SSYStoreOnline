//
//  SquareCollectionViewFlowLayout.m
//  SSY
//
//  Created by 大为科技 on 2018/8/9.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SquareCollectionViewFlowLayout.h"

@implementation SquareCollectionViewFlowLayout

-(NSMutableArray *)attrsArr
{
    if(!_attrsArr){
        _attrsArr=[[NSMutableArray alloc] init];
    }
    return _attrsArr;
}

-(void)prepareLayout
{
    [super prepareLayout];
    [self.attrsArr removeAllObjects];
    
    //头部视图
    UICollectionViewLayoutAttributes *headerAttrs = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathWithIndex:0]];
    headerAttrs.frame = CGRectMake(0, 0, self.collectionView.frame.size.width, 50);
    [self.attrsArr addObject:headerAttrs];
    
    
    
    
    NSInteger count =[self.collectionView  numberOfItemsInSection:0];
    for (int i=0; i<count; i++) {
        NSIndexPath *  indexPath =[NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes * attrs=[self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArr addObject:attrs];
    }
    
    
    //底部视图
    UICollectionViewLayoutAttributes *footerAttrs = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:[NSIndexPath indexPathWithIndex:0]];
    footerAttrs.frame = CGRectMake(0,self.collectionView.frame.size.width*2/3+50, self.collectionView.frame.size.width, 50);
    [self.attrsArr addObject:footerAttrs];
    
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArr;
}


#pragma mark ---- 返回CollectionView的内容大小
/*!
 * 如果不设置这个的话  CollectionView就不能滑动
 */
-(CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
}



-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width =self.collectionView.frame.size.width/3;
    UICollectionViewLayoutAttributes * attrs=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];    NSInteger i=indexPath.item;
    if (i==0) {
        attrs.frame = CGRectMake(0, 50, 2*width-4, 2*width-2);
    }else if (i==1){
        attrs.frame = CGRectMake(2*width+2, 50, width-3, width-3);
    }else{
        attrs.frame = CGRectMake(2*width+2, width+50+2, width-3, width-3);
    }
    return attrs;
}

@end
