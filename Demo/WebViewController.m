//
//  WebViewController.m
//  Demo
//
//  Created by Henry Harris on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

@synthesize webView = _webView;
@synthesize helpButton; 

#pragma mark * Setup

- (void)loadInfoContent
{
    NSURL *infoFileURL = [[NSBundle mainBundle] URLForResource:@"web" withExtension:@"html"];
    assert(infoFileURL != nil);
    NSLog(@"url: %@",infoFileURL);

    [self.webView loadRequest:[NSURLRequest requestWithURL:infoFileURL]];
}

#pragma mark * View controller boilerplate

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadInfoContent];
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self action:@selector(helpPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *helpButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    helpButtonItem.accessibilityLabel = @"help";
    self.navigationItem.rightBarButtonItem = helpButtonItem;
    [helpButtonItem release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.webView = nil;
}

- (IBAction)helpPressed:(id)sender{
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Web" message:@"MonkeyTalk can automate embedded UIWebViews including Inputs, TextAreas, DropDowns, Radio Buttons, Checkboxes, and more." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil] autorelease];
    
    [alert show];
    
}

@end