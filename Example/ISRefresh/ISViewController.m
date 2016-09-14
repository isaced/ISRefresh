//
//  ISViewController.m
//  ISRefresh
//
//  Created by isaced on 09/14/2016.
//  Copyright (c) 2016 isaced. All rights reserved.
//

#import "ISViewController.h"
#import <ISRefresh/UIScrollView+ISRefresh.h>

@interface ISViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.tableView addHeaderRefreshWithCallback:^{
        NSLog(@"refresh success...");
        
        __block ISViewController *weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tableView endRefreshing];
        });
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    return cell;
}

@end
