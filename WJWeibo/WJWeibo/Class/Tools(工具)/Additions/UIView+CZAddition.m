//
//  UIView+CZAddition.m
//
//  Created by yao wei on 16/5/11.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "UIView+CZAddition.h"

@implementation UIView (CZAddition)

- (UIImage *)yw_snapshotImage {

    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

@end
