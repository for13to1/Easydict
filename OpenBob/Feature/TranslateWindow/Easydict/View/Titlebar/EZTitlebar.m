//
//  EZTitlebar.m
//  Open Bob
//
//  Created by tisfeng on 2022/11/19.
//  Copyright © 2022 izual. All rights reserved.
//

#import "EZTitlebar.h"
#import "EZTitleBarMoveView.h"

@interface EZTitlebar ()

@end

@implementation EZTitlebar

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    EZTitleBarMoveView *moveView = [[EZTitleBarMoveView alloc] init];
    moveView.wantsLayer = YES;
    moveView.layer.backgroundColor = NSColor.clearColor.CGColor;
    [self addSubview:moveView];
    [moveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    EZHoverButton *pinButton = [[EZHoverButton alloc] init];
    [self addSubview:pinButton];
    self.pinButton = pinButton;
    NSImage *image = [NSImage imageNamed:@"pin3"];
    NSImage *normalImage = [image imageWithTintColor:NSColor.grayColor];
    pinButton.normalImage = normalImage;

    NSImage *hightlightImage = [image imageWithTintColor:[NSColor mm_colorWithHexString:@"#51A4FF"]];
    NSImage *selectedImage = [image imageWithTintColor:[NSColor mm_colorWithHexString:@"#007AFF"]];
    pinButton.hoverImage = hightlightImage;

    pinButton.highlightImage = hightlightImage;
    pinButton.selectedImage = selectedImage;
    pinButton.backgroundSelectedColor = NSColor.clearColor;
    pinButton.cornerRadius = 2;
    [pinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(22, 22));
        make.left.inset(15);
        make.top.equalTo(self).offset(5);
    }];
    
    pinButton.canSelected = YES;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
