//
//  ViewController.m
//  iOSGoogleTTS
//
//  Created by Nelson Fajardo on 8/08/13.
//  Copyright (c) 2013 BeautifulChaos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)play:(id)sender {
    NSString* escapedUrlString = [_texto.text stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];
    
    if([escapedUrlString length]>0)
    {
        
        NSString *_sound =[NSString stringWithFormat:@"http://translate.google.com/translate_tts?tl=es&q=%@",escapedUrlString];
        
        NSURL *_url =[[NSURL alloc] initWithString:_sound];
        
        _player = [[AVPlayer alloc] initWithURL:_url];
        [   _player play];
    }
    
}

@end
