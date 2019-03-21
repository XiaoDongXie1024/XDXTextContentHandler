//
//  XDXTextContentHandler.h
//  XDXTextContentHandler
//
//  Created by 小东邪 on 2019/3/21.
//  Copyright © 2019 小东邪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XDXTextContentHandler : NSObject

/***********************************************************************************
 *                                                                                  *
 *       Main func : Filter emoji and handle text length limit                      *
 *                                                                                  *
 ************************************************************************************/


/**
 *  - (void)textViewDidChange:(UITextView *)textView
 */
+ (void)handleTextViewDidChangeWithTextView:(UITextView *)textView
                              textMaxLength:(int)textMaxLength
                                  isShowTip:(BOOL)isShowTip;


/**
 * - (void)textFiledEditChanged:(NSNotification *)obj
 */
+ (void)handleTextFiledEditChangedWithNotification:(NSNotification *)notification
                                     textMaxLength:(int)textMaxLength
                                         isShowTip:(BOOL)isShowTip;


/**
 *  - (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
 */
+ (BOOL)handleTextViewShouldChangeTextInRangeWithTextView:(UITextView *)textView
                                                    range:(NSRange)range
                                          replacementText:(NSString *)text
                                                isShowTip:(BOOL)isShowTip;

/*
 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 */
+ (BOOL)handleTextFiledShouldChangeTextInRangeWithTextFiled:(UITextField *)textFiled
                                                      range:(NSRange)range
                                            replacementText:(NSString *)text
                                                  isShowTip:(BOOL)isShowTip;

@end

NS_ASSUME_NONNULL_END
