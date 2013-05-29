//
//  iPhoneProcessViewController.m
//  ActivityMonitor++
//
//  Created by st on 29/05/2013.
//  Copyright (c) 2013 st. All rights reserved.
//

#import "AppDelegate.h"
#import "iPhoneProcessSortViewController.h"

@interface iPhoneProcessSortViewController() <UIPickerViewDataSource, UIPickerViewDelegate>
@property (assign, nonatomic) SortFilter_t  currentFilter;
@end

@implementation iPhoneProcessSortViewController
@synthesize currentFilter;

#pragma mark - override

- (id)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0.0f, 40.0f, 320.0f, 216.0f);
        self.showsSelectionIndicator = YES;
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark - public

- (void)setFilter:(SortFilter_t)filter
{
    [self selectRow:filter inComponent:0 animated:NO];
    self.currentFilter = filter;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return SORT_CHOICE_COUNT;
}

#pragma mark - UIPickerViewDelegate

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    assert(row < SORT_CHOICE_COUNT);
    return [NSString stringWithCString:sortChoices[row] encoding:NSASCIIStringEncoding];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.currentFilter = row;
    [self.sortDelegate processSortFilterChanged:self.currentFilter];
}

@end