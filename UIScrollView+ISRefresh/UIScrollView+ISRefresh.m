//
//  UIScrollView+ISRefresh.m
//
//  Created by isaced on 15/1/23.
//  Copyright (c) 2015 Year isaced. All rights reserved.
//

#import "UIScrollView+ISRefresh.h"
#import <objc/runtime.h>

static const void *ISHeaderRefreshControlKey = &ISHeaderRefreshControlKey;
static const void *ISHeaderRefreshCallbackKey = &ISHeaderRefreshCallbackKey;

@interface UIScrollView()

@property (nonatomic, strong) UIRefreshControl *headerRefreshControl;
@property (nonatomic, copy) voidBlock headerRefreshCallback;

@end

@implementation UIScrollView (ISRefresh)

-(void)addHeaderRefreshWithCallback:(voidBlock)block{
    
    // Create a UIRefreshControl
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    
    if (block) {
        self.headerRefreshCallback = block;

        [refreshControl addTarget:self
                           action:@selector(headerRefreshComplate:)
                 forControlEvents:UIControlEventValueChanged];
        
        self.headerRefreshControl = refreshControl;
    }

    [self addSubview:refreshControl];
}

- (void)headerRefreshComplate:(UIRefreshControl *)refreshControl{
    if (self.headerRefreshCallback) {
        
        // Go to Main Queue
        dispatch_async(dispatch_get_main_queue(), ^{
            self.headerRefreshCallback();
        });
    }
}

-(void)beginRefreshing{
    [self.headerRefreshControl beginRefreshing];
}

-(void)endRefreshing{
    [self.headerRefreshControl endRefreshing];
}


#pragma mark setter & getter

-(voidBlock)headerRefreshCallback{
    return objc_getAssociatedObject(self, ISHeaderRefreshCallbackKey);
}
-(void)setHeaderRefreshCallback:(voidBlock)headerRefreshCallback{
    objc_setAssociatedObject(self, ISHeaderRefreshCallbackKey, headerRefreshCallback, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIRefreshControl *)headerRefreshControl{
    return objc_getAssociatedObject(self, ISHeaderRefreshControlKey);
}
-(void)setHeaderRefreshControl:(UIRefreshControl *)headerRefreshControl{
    objc_setAssociatedObject(self, ISHeaderRefreshControlKey, headerRefreshControl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
