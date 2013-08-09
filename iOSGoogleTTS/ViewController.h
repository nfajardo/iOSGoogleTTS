//
//  ViewController.h
//  iOSGoogleTTS
//
//  Created by Nelson Fajardo on 8/08/13.
//  Copyright (c) 2013 BeautifulChaos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UIPickerViewDelegate>
{
    
    __weak IBOutlet UITextField *_texto;
    __weak IBOutlet UITextField *_language_tf;
    NSArray *languages_array;
    
}
@property (nonatomic,weak) IBOutlet UIButton *playButton;
@property(nonatomic,strong) IBOutlet UIPickerView *pickerView;
@end
