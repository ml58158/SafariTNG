//
//  InternetViewController.m
//  SafariTNG
//
//  Created by Matt Larkin on 3/11/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//

#import "InternetViewController.h"

@interface InternetViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation InternetViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView.delegate = self;
}

-(void)goToURLString:(NSString *)string {
    NSString *urlString =string;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];


}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.spinner startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self goToURLString:@"http://www.mobilemakers.co"];
    }

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alert = [UIAlertView new];
    alert.delegate = self;
    alert.title = @"Loading Failed :-(";
    alert.message = error.localizedDescription;
    [alert addButtonWithTitle:@"Dismiss"];
    [alert show];
    [self.spinner stopAnimating];
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [self goToURLString:textField.text];
    return TRUE;

}


@end
