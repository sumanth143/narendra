//
//  ViewController.h
//  paypal
//
//  Created by student on 10/17/17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"
#import "PayPalConfiguration.h"
#import "PayPalPaymentViewController.h"

@interface ViewController : UIViewController<PayPalPaymentDelegate>
@property(nonatomic,strong)PayPalConfiguration * configuration;
- (IBAction)paymentbtn:(id)sender;


@end

