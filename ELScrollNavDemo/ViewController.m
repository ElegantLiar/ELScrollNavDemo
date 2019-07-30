//
//  ViewController.m
//  ELScrollNavDemo
//
//  Created by ElegantLiar on 2019/7/30.
//  Copyright © 2019 ElegantLiar. All rights reserved.
//

#import "ViewController.h"
#import "DemoTableViewCell.h"
#import "UIColor+Extend.h"

@interface ViewController () <
UITableViewDelegate,
UITableViewDataSource
>

@end

@implementation ViewController {
    UIView          *_navView;
    UITableView     *_tableView;
    UIButton        *_expandBtn;
    
    CGFloat         _navViewHeight;
    
    BOOL            _isAnimating;
    BOOL            _isShow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _isShow = YES;
    _navViewHeight = 64 + CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    
    _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), _navViewHeight)];
    [self.view addSubview:_navView];
    
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, CGRectGetHeight([UIApplication sharedApplication].statusBarFrame), CGRectGetWidth(self.view.frame) - 88, _navViewHeight - CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))];
    navLabel.backgroundColor = [UIColor clearColor];
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    navLabel.shadowOffset = CGSizeMake(0, 1);
    navLabel.textColor = [UIColor hexChangeFloat:@"393939"];
    navLabel.text = @"我是标题";
    [_navView addSubview:navLabel];
    
    UIView *btmLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_navView.frame) - 0.5, CGRectGetWidth(_navView.frame), 0.5)];
    btmLine.backgroundColor = [UIColor hexChangeFloat:@"EFEFEF"];
    [_navView addSubview:btmLine];
    
    _expandBtn = [UIButton buttonWithType:UIButtonTypeCustom];;
    _expandBtn.frame = CGRectMake(CGRectGetWidth(_navView.frame) - 50, CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) + 10, 50, 44);
    _expandBtn.transform = CGAffineTransformMakeRotation(M_PI_4);
    [_expandBtn setImage:[UIImage imageNamed:@"profile_icon_focus"] forState:UIControlStateNormal];
    [_expandBtn addTarget:self action:@selector(expandBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_expandBtn];
    
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, CGRectGetHeight(_navView.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - _navViewHeight);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.scrollsToTop = YES;
    [self.view addSubview:_tableView];
    
    [_tableView setEstimatedRowHeight:0];
    [_tableView setEstimatedSectionHeaderHeight:0];
    [_tableView setEstimatedSectionFooterHeight:0];
    
    [_tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([DemoTableViewCell class])];
}

- (void)expandBtnClick {
    [self makeNavAnimation];
}

- (void)showNav {
    if (_isShow) return;
    [self makeNavAnimation];
}

- (void)hideNav {
    if (!_isShow) return;
    [self makeNavAnimation];
}

- (void)makeNavAnimation {
    if (_isAnimating) {
        return;
    }
    
    [UIView animateWithDuration:0.35 animations:^{
        if (!_isShow) {
            _navView.frame = CGRectMake(0, 0, CGRectGetWidth(_navView.frame), _navViewHeight);
            _tableView.frame = CGRectMake(0, CGRectGetHeight(_navView.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)  - _navViewHeight);
        } else {
            _navView.frame = CGRectMake(0, - _navViewHeight, CGRectGetWidth(_navView.frame), _navViewHeight);
            _tableView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
        }
        _isShow ^= 1;
        _isAnimating = NO;
    }];
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 88;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DemoTableViewCell class]) forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview];
    if (translation.y < 0 && scrollView.tracking) {
        [self hideNav];
    }
    
    if (translation.y > 0 && scrollView.tracking) {
        [self showNav];
    }
}

@end
