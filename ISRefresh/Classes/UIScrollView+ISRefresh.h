//
//  UIScrollView+ISRefresh.h
//
//  Created by isaced on 15/1/23.
//  Copyright (c) 2015 Year isaced. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^voidBlock)(void);

@interface UIScrollView (ISRefresh)

- (void)addHeaderRefreshWithCallback:(voidBlock)block;

- (void)beginRefreshing;

- (void)endRefreshing;

@end
