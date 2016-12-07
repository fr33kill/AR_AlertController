//
//  AR_AlertController.m
//
//
//  Created by Aravind Raj Vijayakumar on 06/12/16.
//  Copyright © 2016 Aravind Raj Vijayakumar. All rights reserved.
//

#import "AR_AlertController.h"

#pragma mark - UIApplication Category
@interface UIApplication (ViewControllerToShowAlert)

+ (UIViewController*) topMostViewController;
+ (UIViewController *) viewControllerForShowingAlert;

@end

@implementation UIApplication (ViewControllerToShowAlert)

+ (UIViewController*) topMostViewController
{
    UIViewController *topMostController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topMostController.presentedViewController) {
        
        topMostController = topMostController.presentedViewController;
    }
    return topMostController;
}

+ (UIViewController *) viewControllerForShowingAlert
{
    UIViewController *topMostController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *lastController;
    while (topMostController.presentedViewController) {
        
        if ([topMostController.presentedViewController isKindOfClass:[UIAlertController class]]) {
            return lastController;
        }
        
        lastController = topMostController.presentedViewController;
        topMostController = topMostController.presentedViewController;
    }
    return topMostController;
}

@end

#pragma mark - CustomAlertControllerMethods

@implementation AR_AlertController

+ (AR_AlertController *) showAlertControllerWithTitle: (NSString *) title andAlertMessage: (NSString *) alertMessage {

    AR_AlertController* alert = [AR_AlertController alertControllerWithTitle:title
                                                                   message:alertMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [alert dismissViewControllerAnimated:NO completion:nil];
                                                          }];
    
    [alert addAction:defaultAction];
    [[UIApplication viewControllerForShowingAlert] presentViewController:alert animated:YES completion:nil];
    return alert;
}

+ (AR_AlertController *) showAlertControllerWithTitle: (NSString *) title  andError: (NSError *) error {

    AR_AlertController* alert = [AR_AlertController alertControllerWithTitle:title
                                                                     message:[self fullErrorDescription:error]
                                                              preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [alert dismissViewControllerAnimated:NO completion:nil];
                                                          }];
    
    [alert addAction:defaultAction];
    [[UIApplication viewControllerForShowingAlert]  presentViewController:alert animated:YES completion:nil];
    return alert;

}

+ (AR_AlertController *) showAlertControllerWithTitle: (NSString *)title andAlertMessage: (NSString *) alertMessage customAlertButton: (NSString *) buttonName buttonActionBlock: (booleanBlock) chooseButtonBlock {

    AR_AlertController* alert = [AR_AlertController alertControllerWithTitle:title
                                                                 message:alertMessage
                                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [alert dismissViewControllerAnimated:NO completion:nil];
                                                              chooseButtonBlock(YES);
                                                          }];
    
    UIAlertAction* continueAction = [UIAlertAction actionWithTitle:buttonName style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action) {
                                                               
                                                               [alert dismissViewControllerAnimated:NO completion:nil];
                                                               chooseButtonBlock(NO);
                                                           }];
    
    [alert addAction:continueAction];
    [alert addAction:defaultAction];
    [[UIApplication viewControllerForShowingAlert]  presentViewController:alert animated:YES completion:nil];
    return alert;
}

+ (AR_AlertController *) showAlertControllerWithTitle: (NSString *)title andAlertMessage: (NSString *) message customAlertButtons: (NSArray *) buttonNames buttonActionBlock: (integerBlock) chooseButtonBlock {

    AR_AlertController* alert = [AR_AlertController alertControllerWithTitle:title
                                                                 message:message
                                                          preferredStyle:UIAlertControllerStyleAlert];
    for (int buttonIndex = 0; buttonIndex < buttonNames.count; buttonIndex++) {
        
        UIAlertAction* action = [UIAlertAction actionWithTitle:[buttonNames objectAtIndex:buttonIndex] style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           
                                                           [alert dismissViewControllerAnimated:NO completion:nil];
                                                           chooseButtonBlock(buttonIndex);
                                                       }];
        [alert addAction:action];
    }
    [[UIApplication viewControllerForShowingAlert]  presentViewController:alert animated:YES completion:nil];
    return alert;
    
}

+ (AR_AlertController *) showAlertControllerWithException: (NSException *) exception {
    
    AR_AlertController* alert = [AR_AlertController alertControllerWithTitle:exception.name
                                                                     message:exception.reason
                                                              preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [alert dismissViewControllerAnimated:NO completion:nil];
                                                          }];
    
    [alert addAction:defaultAction];
    [[UIApplication viewControllerForShowingAlert]  presentViewController:alert animated:YES completion:nil];
    return alert;

}

+ (NSString *) fullErrorDescription:(NSError *)error {
    
    NSString*fullErrorDescription = [NSString stringWithFormat:@"Error Code - %ld \n Error Description - %@ \n Suggestion - %@ ", (long)error.code, [error localizedDescription], [error localizedRecoverySuggestion]];
    return fullErrorDescription;
}

@end
