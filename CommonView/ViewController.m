//
//  ViewController.m
//  CommonView
//
//  Created by Zahidur Rahman Faisal on 1/9/15.
//  Copyright (c) 2015 Zahidur Rahman Faisal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelViewType;
@property (weak, nonatomic) IBOutlet UIView *viewHolder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionGridClicked:(id)sender {
    _labelViewType.text = @"Grid View";
}

- (IBAction)actionListClicked:(id)sender {
    _labelViewType.text = @"List View";
}

@end
