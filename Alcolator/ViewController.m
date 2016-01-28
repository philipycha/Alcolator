//
//  ViewController.m
//  Alcolator
//
//  Created by Philip Ha on 2016-01-25.
//  Copyright (c) 2016 Bloc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>


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

- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0)
        sender.text = nil;

}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider Value Changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
}

- (IBAction)buttonPressed:(id)sender {
    //was UIButton before why?
    [self.beerPercentTextField resignFirstResponder];
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    float ouncesInOneWineGlass = 5;
    float alcoholPercentageOfWine = 0.13;
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    NSString *beerText;
    if (numberOfBeers ==1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
            }
    
    NSString *wineText;
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1){
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.", nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    self.resultLabel.text = resultText;
    
    
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    //did not know how to do this part had to manually do it
    [self.beerPercentTextField resignFirstResponder];
}

@end
