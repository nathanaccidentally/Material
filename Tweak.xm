// Material! Make notifications better-ish again!
// made by nathanaccidentally. works on iOS 10.0-10.2.

@interface _UIBackdropEffectView : UIView
@end

@interface _UIBackdropView : UIView
@end

%hook _UIBackdropEffectView

-(void)layoutSubviews {
	%orig;
	if([NSStringFromClass([self.superview class]) isEqualToString:@"NCMaterialView"]) [self setHidden:YES];
}

%end

// Both views need to be hidden.

%hook _UIBackdropView

-(void)layoutSubviews {
	%orig;
	if([NSStringFromClass([self.superview class]) isEqualToString:@"NCMaterialView"]) [self setHidden:YES];
}

%end

// Figuring out the above took me 2 days worth of research for nothing. I wanna die. :/
// Hooks background whiteish blur (Unify does nothing with this for some reason) and hides it.

%hook NCMaterialView

-(UIColor *)backgroundColor {
	return [UIColor clearColor];
}

-(void)setBackgroundColor:(UIColor *)backgroundColor {
	%orig([UIColor clearColor]);
}

%end

// Great makes background of NC cells transparent.
// Now I want to make the notifications show more. Thanks ipad_kid!

%hook NCNotificationShortLookView

-(void)setMessageNumberOfLines:(NSUInteger)messageNumberOfLines {
	%orig(6);  // Gives more room for those lines.
}

%end

// Thanks to ipad_kid for the idea! :)
// More screen realestate = happy boy.