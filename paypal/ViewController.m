//
//  ViewController.m
//  paypal
//
//  Created by student on 10/17/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.configuration=[[PayPalConfiguration alloc]init];
    self.configuration.acceptCreditCards=YES;
    self.configuration.merchantName=@"IOSetutorials.com";
    self.configuration.merchantPrivacyPolicyURL=[NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/privacy-full"];
    self.configuration.merchantUserAgreementURL=[NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/useragreement-full"];
    self.configuration.languageOrLocale=[NSLocale preferredLanguages][0];
    self.configuration.payPalShippingAddressOption=PayPalShippingAddressOptionPayPal;
    NSLog(@"pay pal SDK:%@",[PayPalMobile libraryVersion]);

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)paymentbtn:(id)sender
{
    PayPalItem * item1=[PayPalItem itemWithName:@"IPhone" withQuantity:1 withPrice:[NSDecimalNumber decimalNumberWithString:@"745.30"] withCurrency:@"USD" withSku:@"SKU-Iphone6"];
    PayPalItem * item2=[PayPalItem itemWithName:@"MacBookPro" withQuantity:2 withPrice:[NSDecimalNumber decimalNumberWithString:@"874.36"] withCurrency:@"USD" withSku:@"SKU-MacBookPro"];
    NSArray * items=@[item1,item2];
    NSDecimalNumber * subTotal=[PayPalItem totalPriceForItems:items];
    NSDecimalNumber * shipping=[[NSDecimalNumber alloc]initWithString:@"5.48"];
    NSDecimalNumber * tax=[[NSDecimalNumber alloc]initWithString:@"1.48"];
    PayPalPaymentDetails * paymentdetails=[PayPalPaymentDetails paymentDetailsWithSubtotal:subTotal withShipping:shipping withTax:tax ];
    NSDecimalNumber * total=[[subTotal decimalNumberByAdding:shipping]decimalNumberByAdding:tax];
    PayPalPayment * payment=[[PayPalPayment alloc]init];
    payment.amount=total;
    payment.currencyCode=@"USD";
    payment.shortDescription=@"My Payment";
    payment.items=items;
    payment.paymentDetails=paymentdetails;
    if (!payment.processable)
    {
        //some block of code
    }
    PayPalPaymentViewController * paypalviewctrl=[[PayPalPaymentViewController alloc]initWithPayment:payment configuration:self.configuration delegate:self];
    [self presentViewController:paypalviewctrl animated:YES completion:nil];

}

#pragma mark-paypal delgateMethods

-(void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController
{
    NSLog(@"paypal cancel !!!");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController didCompletePayment:(PayPalPayment *)completedPayment
{
    
    NSLog(@"paypal sucess !!!");
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
