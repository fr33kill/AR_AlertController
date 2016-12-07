# AR_AlertController
- Custom AlertController class that finds the topmost viewcontroller and shows alert in iPhone/iPad applications above iOS9.0
- Just import the class and call your required method to present your alert.

# Method to just show alert with message.
- To show alertview with title and message. It will have just OK button to dismiss the alertview. 
- Pass title and alert message as NSString
- Call it as
```
[AR_AlertController showAlertControllerWithTitle:@"title" andAlertMessage:@"alertMessage"];
```

# Method to just show alert with message, one custom button with boolean return function.
- To show alertview which has title, message, one custom alert button and block that retrieves the alert button action with Boolean.
- It will have default Cancel and one custom button title as NSString.
- Pass title, alert message and custom button title as NSString.
- Default Cancel button returns YES and custom button returns NO.
- Call it as
```
[AR_AlertController showAlertControllerWithTitle:@"title" andAlertMessage:@"alertMessage" customAlertButton:@"customButtonTitle" buttonActionBlock:^(BOOL bCancelClicked) {
        if(bCancelClicked) {
          //Do stuff
        } else {
          //Do stuff
        }
    }]; 
```
# Method to show alert with message, custom buttons, with integer return function.
- To show alertview which has title, message, custom alert buttons and block that retrieves the alert button action with Integer.
- It will have custom button titles as NSArray
- Pass title, alert message as NSString and custom button titles as NSArray.
- Block returns button index of the buttonsArray.
- Call it as 
```[AR_AlertController showAlertControllerWithTitle:@"title" andAlertMessage:@"alertMessage" customAlertButtons:@[@"button1",@"button2"] buttonActionBlock:^(int buttonIndex) {
        switch (buttonIndex) {
            case 0:
               //Do stuff
                break;
            case 1:
               //Do stuff
                break;
            default:
                break;
        }
    }];
```
# Method to show alert with title and error.
- To show alertview with title and error. It will have just OK button to dismiss the alertview.
- Pass title as NSString and error as NSError. 
- It will set the error's code, localized description and localizedRecoverySuggestion as message.
- Call it as 
```
[AR_AlertController showAlertControllerWithTitle:@"title" andError:error];
```

# Method to show alert with exception title and reason.
- To show alertview with title and exception. It will have just OK button to dismiss the alertview.
- Pass exception as NSException.
- It will set the exception name as title and exception reason as message.
- Call it as 
```
[AR_AlertController showAlertControllerWithException:exception];
```
