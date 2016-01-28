//
//  ViewController.h
//  Alcolator
//
//  Created by Philip Ha on 2016-01-25.
//  Copyright (c) 2016 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;

- (void)buttonPressed:(UIButton *)sender;

@end

