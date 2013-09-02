//
//  QPlotLine.h
//  chartDemo
//
//  Created by 钱长存 on 13-1-18.
//  Copyright (c) 2013年 钱长存. All rights reserved.
//
#import <CoreGraphics/CoreGraphics.h>
#define kXaxisData     @"XaxisData"
#define kYaxisData     @"YaxisData"
#define kLineColor     @"LineColor"

@class QPlotLine;
@protocol QPlotLineDataSource <NSObject>
-(NSInteger)numberOfDataPointsForLinePlot:(QPlotLine *)linePlot;
-(NSDecimalNumber *)minXValueForLinePlot:(QPlotLine *)linePlot;
-(NSDecimalNumber *)maxXValueForLinePlot:(QPlotLine *)linePlot;
-(NSDecimalNumber *)minYValueForLinePlot:(QPlotLine *)linePlot;
-(NSDecimalNumber *)maxYValueForLinePlot:(QPlotLine *)linePlot;
-(NSArray *)dataForLinePlot:(QPlotLine *)linePlot;
@end

@interface QPlotLine : UIView
{
    NSArray *currentYTickMarks;
    NSArray *currentXTickMarks;
    NSNumberFormatter *numberFormatter;
}
@property (nonatomic, assign) id <QPlotLineDataSource> dataSource;
@property (nonatomic, strong) NSArray *xTickMarks;
@property (nonatomic, strong) NSArray *yTickMarks;
@property (nonatomic, strong) NSArray *xTickLabels;
@property (nonatomic, strong) NSArray *yTickLabels;
@property (nonatomic, strong) NSString *title;
@end