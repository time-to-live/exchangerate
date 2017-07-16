//
//  ViewController.m
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyAPI.h"
#import "ExchangeCourseAPI.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate> {
    NSInteger _selectedRow;
}

@property (strong, nonatomic) IBOutlet UITextField *amountTF;
@property (strong, nonatomic) IBOutlet UILabel *fromCurrency;

@property (strong, nonatomic) IBOutlet UILabel *resulLabel;
@property (strong, nonatomic) IBOutlet UIPickerView *currencyPicker;
@property (strong, nonatomic) IBOutlet UILabel *toCurrency;

@property (strong, nonatomic) UILabel *changingLabel;
@property (strong, nonatomic) NSArray *currencies;
@property (strong, nonatomic) Currency *selectedFromCurrency;
@property (strong, nonatomic) Currency *selectedToCurrency;
- (IBAction)btnCulc:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _currencies = [[CurrencyAPI sharedInstance] currencies];
    
    [_currencyPicker setHidden:YES];
    
    UITapGestureRecognizer * tapOnFromCurrencyRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleFromCurrencyTap)];
    [_fromCurrency setUserInteractionEnabled:YES];
    [_fromCurrency addGestureRecognizer:tapOnFromCurrencyRecognizer];
    
    UITapGestureRecognizer * tapOnToCurrencyRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleToCurrencyTap)];
    [_toCurrency setUserInteractionEnabled:YES];
    [_toCurrency addGestureRecognizer:tapOnToCurrencyRecognizer];
    
    UITapGestureRecognizer * handleTapOnView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideCurrencyPicker)];
    [self.view addGestureRecognizer:handleTapOnView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showCurrencyPicker {
    [_currencyPicker setHidden:NO];
}

- (void)hideCurrencyPicker {
    [_currencyPicker setHidden:YES];
    [_currencyPicker selectedRowInComponent:0];
    Currency * cur = [_currencies objectAtIndex:_selectedRow];
    [_changingLabel setText:[cur name]];
    if ([_changingLabel isEqual:_fromCurrency]) {
        _selectedFromCurrency = cur;
    } else {
        _selectedToCurrency = cur;
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _selectedRow = row;
}

- (void)handleFromCurrencyTap {
    [self showCurrencyPicker];
    _changingLabel = _fromCurrency;
}

- (void)handleToCurrencyTap {
    [self showCurrencyPicker];
    _changingLabel = _toCurrency;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    Currency * currency = [_currencies objectAtIndex:row];
    return [currency name];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _currencies.count;
}


- (IBAction)btnCulc:(id)sender {
    if (_selectedToCurrency) {
        if (_selectedFromCurrency) {
            ExchangeCourse * course = [[ExchangeCourseAPI sharedInstance] courseFromCurrency:_selectedFromCurrency toCurrency:_selectedToCurrency];
            if (course) {
                NSLog(@"rate = %f", [course rate]);
                NSLog (@"amount = %@", [_amountTF text]);
                double amount = [course rate] * [[_amountTF text] doubleValue];
                [_resulLabel setText:[NSString stringWithFormat:@"%.2f", amount]];
            } else {
                // TODO add allert
                NSLog(@"Rate not found");
            }
        } else {
            // TODO add allert or lock btn
            NSLog(@"You must specify currency from");
        }
    } else {
        // TODO add allert or lock btn
        NSLog(@"You must specify currency to");
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_amountTF resignFirstResponder];
    return YES;
}
@end
