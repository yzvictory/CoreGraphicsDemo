//
//  CGView.m
//  CoreGraphicsDemo
//
//  Created by yz on 15/11/4.
//  Copyright © 2015年 DeviceOne. All rights reserved.
//

#import "CGView.h"

@implementation CGView

- (void)drawRect:(CGRect)rect
{
    //获得图形上下文
    //注意这个方法UIGraphicsGetCurrentContext，在其他的方使用获得的content可能会为nil
    CGContextRef content = UIGraphicsGetCurrentContext();
    //绘制直线
    [self drawLine:content];
    //绘制矩形
    [self drawCustomRect:content];
    //绘制圆形
    [self drawCircle:content];
    //绘制圆弧
    [self drawArc:content];
    [self drawBezier:content];
    //绘制图片
    [self drawImage:content];
    //绘制文本
    [self drawText:content];
}
#pragma -mark - 私有方法
//绘制直线
- (void) drawLine:(CGContextRef) content
{
    //创建一条路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextSetLineWidth(content, 2);
    CGPathMoveToPoint(path, nil, 10, 10);
    CGPathAddLineToPoint(path, nil, 200, 200);
    //把路径添加到上下文，并进行渲染
    CGContextAddPath(content, path);
    CGContextStrokePath(content);
    //内存管理，凡是Create、Copy、Retain方法创建出来的的值，都必须手动释放。
    CGPathRelease(path);
}
//绘制矩形
- (void) drawCustomRect:(CGContextRef) content
{
    //绘制矩形的方很多
    CGContextAddRect(content, CGRectMake(20, 30, 40, 50));
    CGContextStrokePath(content);
}
//绘制圆形
- (void) drawCircle:(CGContextRef) content
{
    //参数的意义
    //x,y,半径,开始角度,结束角度,1逆时针,0顺时针
    CGContextAddArc(content, 50, 50, 50, -M_PI, M_PI, 1);
//    CGContextFillPath(content);
    CGContextStrokePath(content);
}
//绘制圆弧
- (void) drawArc:(CGContextRef) content
{
    //参数的意义
    //x,y,半径,开始角度,结束角度,1逆时针,0顺时针
    CGContextAddArc(content, 150, 150, 50, M_PI_4, M_PI_2, 0);
    CGContextStrokePath(content);

}
//绘制贝赛尔曲线
- (void) drawBezier:(CGContextRef) content
{
    CGContextBeginPath(content);
    //draw to this point
    CGContextMoveToPoint(content, 200.0, 10.0);
    //draw 贝塞尔曲线
    CGContextAddQuadCurveToPoint(content, 15, 220, 150, 200);
    CGContextStrokePath(content);
}
//绘制图片
- (void) drawImage:(CGContextRef) content
{
    UIImage *img = [UIImage imageNamed:@"test.jpg"];
    [img drawInRect:CGRectMake(100, 200, 100, 100)];
}
//绘制文字
- (void) drawText:(CGContextRef) content
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    attributes[NSForegroundColorAttributeName] = [UIColor blueColor];
    NSAttributedString *text = [[NSAttributedString alloc]initWithString:@"我是测试的" attributes:attributes];
    [text drawAtPoint:CGPointMake(100, 50)];
}
@end
























