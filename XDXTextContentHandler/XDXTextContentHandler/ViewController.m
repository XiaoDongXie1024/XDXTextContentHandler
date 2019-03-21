//
//  ViewController.m
//  XDXTextContentHandler
//
//  Created by 小东邪 on 2019/3/21.
//  Copyright © 2019 小东邪. All rights reserved.
//

#import "ViewController.h"
#import "XDXTextContentHandler.h"

const static NSUInteger kTitleTextMaxLength = 10;

@interface ViewController ()<UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *testTextFiled;
@property (weak, nonatomic) IBOutlet UITextView *testTextView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.testTextFiled.delegate = self;
    self.testTextView.delegate  = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFiledEditChanged:)
                                                 name:@"UITextFieldTextDidChangeNotification"
                                               object:self.testTextFiled];
}

#pragma mark - Notification
- (void)textFiledEditChanged:(NSNotification *)obj {
    [XDXTextContentHandler handleTextFiledEditChangedWithNotification:obj textMaxLength:kTitleTextMaxLength isShowTip:YES];
}
#pragma mark - Delegate

#pragma mark TextFiled
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [XDXTextContentHandler handleTextFiledShouldChangeTextInRangeWithTextFiled:textField range:range replacementText:string isShowTip:YES];
}

#pragma mark TextView
- (void)textViewDidChange:(UITextView *)textView {
    [XDXTextContentHandler handleTextViewDidChangeWithTextView:textView textMaxLength:kTitleTextMaxLength isShowTip:YES];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return [XDXTextContentHandler handleTextViewShouldChangeTextInRangeWithTextView:textView range:range replacementText:text isShowTip:YES];
}

#pragma mark - Dealloc
- (void)dealloc {
    _testTextView.delegate  = nil;
    _testTextFiled.delegate = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
