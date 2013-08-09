//
//  ViewController.h
//  iOSGoogleTTS
//
//  Created by Nelson Fajardo on 8/08/13.
//  Copyright (c) 2013 BeautifulChaos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    AVPlayer *_player;
    __weak IBOutlet UITextField *_texto;
}

@end
