//
//  DLWMLinearMenuViewController.m
//  DLWidgetMenu
//
//  Created by Vincent Esche on 05/11/13.
//  Copyright (c) 2013 Vincent Esche. All rights reserved.
//

#import "DLWMLinearMenuViewController.h"

#import "DLWMLinearLayout.h"

@interface DLWMLinearMenuViewController ()

@property (readwrite, assign, nonatomic) BOOL layered;//?

@property (readwrite, assign, nonatomic) NSUInteger items;//部件数目
@property (readwrite, assign, nonatomic) CGFloat itemSpacing;//部件间隙
@property (readwrite, assign, nonatomic) CGFloat centerSpacing;//距离中心距离
@property (readwrite, assign, nonatomic) CGFloat angle;//夹角

@property (weak, nonatomic) IBOutlet UISlider *itemsSlider;//部件数目slider
@property (weak, nonatomic) IBOutlet UILabel *itemsLabel;//数目展示

@property (weak, nonatomic) IBOutlet UISlider *itemSpacingSlider;//部件间隙大小slider
@property (weak, nonatomic) IBOutlet UILabel *itemSpacingLabel;//间隙大小展示

@property (weak, nonatomic) IBOutlet UISlider *centerSpacingSlider;//距离中心距离slider
@property (weak, nonatomic) IBOutlet UILabel *centerSpacingLabel;//距离大小展示

@property (weak, nonatomic) IBOutlet UISlider *angleSlider;//与X轴角度
@property (weak, nonatomic) IBOutlet UILabel *angleLabel;//夹角展示

@end

@implementation DLWMLinearMenuViewController

#pragma mark - DLWMMenuLayout

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
		
    }
    return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.items = 3;
	self.itemSpacing = 45.0; // in pixels
	self.centerSpacing = 50.0; // in pixels
	self.angle = M_PI_2 * 3; // in radians
}

+ (id<DLWMMenuLayout>)layout {
	return [[DLWMLinearLayout alloc] initWithAngle:0.0 itemSpacing:45.0 centerSpacing:50.0];
}

#pragma mark - DLWMMenuDataSource Protocol

- (NSUInteger)numberOfObjectsInMenu:(DLWMMenu *)menu {
	return self.items;
}

#pragma mark - IBActions

- (IBAction)changeItems:(UISlider *)sender {
	self.items = sender.value;
}

- (IBAction)changeItemSpacing:(UISlider *)sender {
	self.itemSpacing = sender.value;
}

- (IBAction)changeCenterSpacing:(UISlider *)sender {
	self.centerSpacing = sender.value;
}

- (IBAction)changeAngle:(UISlider *)sender {
	self.angle = sender.value;
}

#pragma mark - Accessors

- (void)setItems:(NSUInteger)items {
	_items = items;
	[self.menu reloadData];
	self.itemsSlider.value = items;
	self.itemsLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)items];
}

- (void)setItemSpacing:(CGFloat)itemSpacing {
	_itemSpacing = itemSpacing;
	((DLWMLinearLayout *)self.menu.layout).itemSpacing = itemSpacing;
	self.itemSpacingSlider.value = itemSpacing;
	self.itemSpacingLabel.text = [NSString stringWithFormat:@"%.0fpx", itemSpacing];
}

- (void)setCenterSpacing:(CGFloat)centerSpacing {
	_centerSpacing = centerSpacing;
	((DLWMLinearLayout *)self.menu.layout).centerSpacing = centerSpacing;
	self.centerSpacingSlider.value = centerSpacing;
	self.centerSpacingLabel.text = [NSString stringWithFormat:@"%.0fpx", centerSpacing];
}

- (void)setAngle:(CGFloat)angle {
	_angle = angle;
	((DLWMLinearLayout *)self.menu.layout).angle = angle;
	self.angleSlider.value = angle;
	self.angleLabel.text = [NSString stringWithFormat:@"%.0fº", (angle / M_PI) * 180];
}

@end
