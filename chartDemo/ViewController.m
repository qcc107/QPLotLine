//
//  ViewController.m
//  chartDemo
//
//  Created by 钱长存 on 13-1-15.
//  Copyright (c) 2013年 钱长存. All rights reserved.
//

#import "ViewController.h"
#import "QPlotLine.h"

@interface ViewController ()
@property (nonatomic, strong)QPlotLine *qLineplot;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor grayColor]];
//    CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*0.5)
    self.qLineplot = [[[QPlotLine alloc] initWithFrame:CGRectMake(0, 0, 320,240)] autorelease];
    self.qLineplot.dataSource = (id)self;
    [self.qLineplot setXTickMarks:@[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20,@21,@22,@23,@24]];
    [self.qLineplot setYTickMarks:@[@0,@5,@10,@15,@20,@25,@30,@35,@40,@45,@50]];
    //获取当前时间
    NSDate *now = [NSDate date];
    NSLog(@"now date is: %@",now);
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];

    int year = [dateComponent year];
    int month = [dateComponent month];
    int day = [dateComponent day];
    int hour = [dateComponent hour];
    int minute = [dateComponent minute];
    int second = [dateComponent second];
    NSLog(@"year is: %d", year);
    NSLog(@"month is: %d", month);
    NSLog(@"day is: %d", day);
    NSLog(@"hour is: %d", hour);
    NSLog(@"minute is: %d", minute);
    NSLog(@"second is: %d", second);
    
    int lastTick = hour+1;
    NSMutableArray *tickArray = [[NSMutableArray alloc] initWithCapacity:7];
    for (int i=6; i>0; --i) {
        [tickArray addObject:[NSString stringWithFormat:@"%d:00",(lastTick-4*i+24)%24]];
    }
    [tickArray addObject:[NSString stringWithFormat:@"%d:00",lastTick]];
    NSMutableArray *displayTickArray = [[NSMutableArray alloc] initWithCapacity:25];
    
    [tickArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [displayTickArray addObject:obj];
        if (idx<6) {
            [displayTickArray addObject:@""];
            [displayTickArray addObject:@""];
            [displayTickArray addObject:@""];
        }
    }];
    [tickArray release];
    [self.qLineplot setXTickLabels:displayTickArray]; //@[@"0",@"",@"",@"3",@"",@"",@"6",@"",@"",@"9",@"",@"",@"12",@"",@"",@"15",@"",@"",@"18",@"",@"",@"21",@"",@"",@"24"]];
    [displayTickArray release];
    [self.qLineplot setYTickLabels:@[@"",@" 5",@"10",@"15",@"20",@"25",@"30",@"35",@"40",@"45",@"50"]];
    [self.qLineplot setTitle:@"17号"];
    [self.view addSubview:[UIButton buttonWithType:UIButtonTypeContactAdd]];
    [self.view addSubview:self.qLineplot];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.qLineplot setFrame:self.view.bounds];
}
-(NSInteger)numberOfDataPointsForLinePlot:(QPlotLine *)linePlot
{
    return 27;
}
-(NSArray *)dataForLinePlot:(QPlotLine *)linePlot
{
    return @[ @{kLineColor:[UIColor greenColor],kXaxisData:@[@0,@1,@2,@3,@3.5,@4,@5,@6,@7,@7.3,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20,@21,@22,@23,@24],kYaxisData:@[@6,@5,@3,@2,@4,@8,@9,@7,@6,@9,@5,@6,@12,@12,@14,@11,@16,@17,@8,@9,@6,@12,@12,@13,@14,@18,@16]}, @{kLineColor:[UIColor blueColor],kXaxisData:@[@0,@1,@2,@3,@3.5,@4,@5,@6,@7,@7.9,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20,@21,@22,@23,@24],kYaxisData:@[@22,@27,@22,@26,@22,@24,@25,@27,@26,@23,@25,@21,@22,@22,@23,@21,@26,@27,@18,@19,@20,@22,@23,@23,@24,@28,@26]}];
}
-(NSDecimalNumber *)minXValueForLinePlot:(QPlotLine *)linePlot
{
    return [NSDecimalNumber decimalNumberWithString:@"0.0"];
}
-(NSDecimalNumber *)maxXValueForLinePlot:(QPlotLine *)linePlot
{
    return [NSDecimalNumber decimalNumberWithString:@"24.0"];
}
-(NSDecimalNumber *)minYValueForLinePlot:(QPlotLine *)linePlot
{
    return [NSDecimalNumber decimalNumberWithString:@"0.0"];

}
-(NSDecimalNumber *)maxYValueForLinePlot:(QPlotLine *)linePlot
{
    return [NSDecimalNumber decimalNumberWithString:@"30.0"];
}
@end
