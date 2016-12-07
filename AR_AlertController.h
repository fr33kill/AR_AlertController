//
//  AR_AlertController.h
//
//
//  Created by Aravind Raj Vijayakumar on 06/12/16.
//  Copyright © 2016 Aravind Raj Vijayakumar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^booleanBlock)(BOOL value);
typedef void (^integerBlock)(int integer);


@interface AR_AlertController : UIAlertController

/**
 ** To show alertview with title and message. It will have just OK button to dismiss the alertview. 
 ** Pass title and alert message as NSString
 **/
+ (AR_AlertController *) showAlertControllerWithTitle: (NSString *) title andAlertMessage: (NSString *) alertMessage;

/**
 ** To show alertview which has title, message, one custom alert button and block that retrieves the alert button action with Boolean.
 ** It will have default Cancel and one custom button title as NSString.
 ** Pass title, alert message and custom button title as NSString.
 ** Default Cancel button returns YES and custom button returns NO.
 **/
+ (AR_AlertController *) showAlertControllerWithTitle: (NSString *)title andAlertMessage: (NSString *) alertMessage customAlertButton: (NSString *) buttonName buttonActionBlock: (booleanBlock) chooseButtonBlock;

/**
 ** To show alertview which has title, message,  custom alert buttons and block that retrieves the alert button action with Integer.
 ** It will have custom button titles as NSArray.
 ** Pass title, alert message as NSString and custom button titles as NSArray.
 ** Block returns button index of the buttonsArray.
 **/
+ (AR_AlertController *) showAlertControllerWithTitle: (NSString *)title andAlertMessage: (NSString *) message customAlertButtons: (NSArray *) buttonNames buttonActionBlock: (integerBlock) chooseButtonBlock;

/**
 ** To show alertview with title and error. It will have just OK button to dismiss the alertview.
 ** Pass title as NSString and error as NSError. 
 ** It will set the error's code, localized description and localizedRecoverySuggestion as message.
 **/
+ (AR_AlertController *) showAlertControllerWithTitle: (NSString *) title  andError: (NSError *) error;

/**
 ** To show alertview with title and exception. It will have just OK button to dismiss the alertview.
 ** Pass exception as NSException.
 ** It will set the exception name as title and exception reason as message.
 **/
+ (AR_AlertController *) showAlertControllerWithException: (NSException *) exception;

/**
 ** To get a full description of Error that occured.
 ** Pass error as NSError and it will return NSString with full description.
 ** It will set the error's code, localized description and localizedRecoverySuggestion as message.
 **/
+ (NSString *) fullErrorDescription:(NSError *)error ;

@end


