//
//  DJViewController.m
//  DJMacros
//
//  Created by Deju Liu on 11/08/2016.
//  Copyright (c) 2016 Deju Liu. All rights reserved.
//

#import "DJViewController.h"
#import "DJSO.h"
#import "DJMacro.h"
#import <FRHyperLabel/FRHyperLabel.h>
#import <TTTAttributedLabel/TTTAttributedLabel.h>

@protocol DJViewControllerDelegate <NSObject>



@end

@interface DJViewController ()
<DJViewControllerDelegate,
TTTAttributedLabelDelegate>

PP_DELEGATE(DJViewControllerDelegate, delegate)

@end

@implementation DJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    {
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"FRHyperLabel hello 世界你好 hello hello" attributes:@{ATT_FONT:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]}];
        
        FRHyperLabel *tf = [[FRHyperLabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        tf.userInteractionEnabled = YES;
        tf.numberOfLines = 0;
        tf.textColor        = [UIColor grayColor];
        tf.font             = [UIFont systemFontOfSize:40];
        tf.backgroundColor = [UIColor lightGrayColor];
        tf.attributedText = att;
        [tf setLinkForSubstring:@"世界你好" withAttribute:@{ATT_TEXT_COLOR:[UIColor redColor],ATT_UNDERLINE_STYLE:@1,ATT_UNDERLINE_COLOR:[UIColor blueColor],ATT_BASELINE_OFFSET:@5,ATT_STRIKETHROUGH_STYLE:@2} andLinkHandler:^(FRHyperLabel *label, NSString *substring) {
            //
        }];
        
        [tf setLinkForSubstring:@"hello" withAttribute:@{ATT_LINK:@"http://www.baidu.com/"} andLinkHandler:^(FRHyperLabel *label, NSString *substring) {
        }];
        
        [self.view addSubview:tf];
    }
    
    {
        
        TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, 100)];
        label.backgroundColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor darkGrayColor];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.numberOfLines = 0;
        
        //设置链接正常样式
        label.linkAttributes = @{ATT_TEXT_COLOR:[UIColor greenColor],
                                 ATT_UNDERLINE_STYLE:@1,
                                 ATT_UNDERLINE_COLOR:[UIColor yellowColor]};
        
        //链接点击样式
        label.activeLinkAttributes = @{ATT_TEXT_COLOR:[UIColor blueColor],
                                 ATT_UNDERLINE_STYLE:@1,
                                 ATT_UNDERLINE_COLOR:[UIColor yellowColor]};
        
        label.inactiveLinkAttributes = @{ATT_TEXT_COLOR:[UIColor purpleColor],
                                 ATT_UNDERLINE_STYLE:@1,
                                 ATT_UNDERLINE_COLOR:[UIColor yellowColor]};
        
        label.text = @"TTTAttributedLabel hello 世界你好 hello hello TTTAttributedLabel hello 世界你好 hello hello TTTAttributedLabel hello 世界你好 hello hello TTTAttributedLabel hello 世界你好 hello hello";
        [label setText:label.text afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            NSRange range = [[mutableAttributedString string] rangeOfString:@"TTTAttributedLabel" options:NSCaseInsensitiveSearch];
            [mutableAttributedString addAttribute:kTTTBackgroundFillColorAttributeName value:[UIColor yellowColor] range:range];
            return mutableAttributedString;
        }];
        [self.view addSubview:label];
        
        float width = 200;
        float height = [label.attributedText dj_heightWithWidth:width];
        CGRect frame = label.frame;
        frame.size.width = width;
        frame.size.height = height;
        label.frame = frame;
        
        [label dj_addLinkToURLString:@"http://www.baidu.com/" subString:@"世界你好"];
        label.delegate = self;
    }
    
    
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 300, 200)];
        label.backgroundColor = [UIColor lightGrayColor];
        label.numberOfLines = 0;
        [self.view addSubview:label];
        
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc] init];
        [att dj_appendString:@"Hello World" withAttributes:@{ATT_FONT:[UIFont systemFontOfSize:20]}];
        
        [att dj_addLine:2];
        
        NSTextAttachment *textAtta = [[NSTextAttachment alloc] init];
        textAtta.image = [UIImage imageNamed:@"AppIcon40x40"];
        textAtta.bounds = CGRectMake(0, 0, 100, 100);
        NSAttributedString *att1 = [NSMutableAttributedString attributedStringWithAttachment:textAtta];
        [att appendAttributedString:att1];
        
        [att dj_addLine:2];
        
        [att dj_appendString:@"Hello World" withAttributes:@{ATT_FONT:[UIFont systemFontOfSize:20]}];
        
        label.attributedText = att;
    }
}

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url {
    DLog(@"点击链接：%@",url);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    
}

@end
