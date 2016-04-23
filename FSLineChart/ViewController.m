//
//  ViewController.m
//  FSLineChart
//
//  Created by Arthur GUIBERT on 30/09/2014.
//  Copyright (c) 2014 Arthur GUIBERT. All rights reserved.
//

#import "ViewController.h"
#import "FSLineChart.h"
#import "UIColor+FSPalette.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet FSLineChart *chart;
@property (nonatomic, strong) IBOutlet FSLineChart *chartWithDates;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSimpleChart];
    
    [self loadChartWithDates];
}

#pragma mark - Setting up the charts

- (void)loadSimpleChart {
    
    NSMutableArray* chartData = [NSMutableArray arrayWithObjects:
                                 [NSNumber numberWithInt:3],
                                 [NSNumber numberWithInt:5],
                                 [NSNumber numberWithInt:8],
                                 [NSNumber numberWithInt:13],
                                 [NSNumber numberWithInt:-3],
                                 [NSNumber numberWithInt:16],
                                 [NSNumber numberWithInt:20],
                                 nil];
    
//    for(int i=0; i < 40; i++) {
//        int r = (rand() + rand()) % 1000;
//        chartData[i] = [NSNumber numberWithInt:r + 200];
//    }
    
    
    // Setting up the line chart
    //y 网格
    self.chart.verticalGridStep = 8;
    //x 几个空
    self.chart.horizontalGridStep = 6;
    
    self.chart.valueLabelPosition = ValueLabelLeft;
    
    //self.chart.fillColor = [UIColor cyanColor];
    self.chart.fillColor = nil;
    
    //x 轴
    self.chart.labelForIndex = ^(NSUInteger item) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)item];
    };
    
    self.chart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    };
    
    [self.chart setChartData:chartData];
}

- (void)loadChartWithDates {
    // Generating some dummy data
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:7];
    for(int i=0;i<7;i++) {
        chartData[i] = [NSNumber numberWithFloat: (float)i / 30.0f + (float)(rand() % 100) / 500.0f];
    }
    
    NSArray* months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July"];
    
    // Setting up the line chart
    _chartWithDates.verticalGridStep = 6;
    _chartWithDates.horizontalGridStep = 3;
    _chartWithDates.fillColor = nil;
    /*
    _chartWithDates.displayDataPoint = NO;
    _chartWithDates.dataPointColor = [UIColor fsOrange];
    _chartWithDates.dataPointBackgroundColor = [UIColor fsOrange];
    _chartWithDates.dataPointRadius = 2;
    _chartWithDates.color = [_chartWithDates.dataPointColor colorWithAlphaComponent:0.3];
    */
    _chartWithDates.valueLabelPosition = ValueLabelLeft;
    
    _chartWithDates.labelForIndex = ^(NSUInteger item) {
        return months[item];
    };
    
    _chartWithDates.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.02f", value];
    };
    
    [_chartWithDates setChartData:chartData];
}

@end
