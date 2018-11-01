import Foundation

extension Input {
    
    // NOTE: This file is a collection of parsing errors from anonymised
    // server logs.
    
    // NSLayoutAnchorConstraintSpace(8) after equation constraint.
    static let papertrail1 = """
        (
        "<_UISystemBaselineConstraint:0x600002d1f4e0 SomeView:0x7fceff1c07a0.bottom <= UILayoutGuide:0x60000306d340'UIViewSafeAreaLayoutGuide'.bottom NSLayoutAnchorConstraintSpace(8)   (active)>",
        "<NSLayoutConstraint:0x600002a911d0 UIInputSetContainerView:0x7fcef9d5bde0.bottom == UIRemoteKeyboardWindow:0x7fcefa227a00.bottom   (active)>",
        "<NSLayoutConstraint:0x600002a9db80 UIInputSetHostView:0x7fcef9d4d6b0.bottom == UIInputSetContainerView:0x7fcef9d5bde0.bottom   (active)>",
        "<NSLayoutConstraint:0x600002a8d9f0 SomeView:0x7fceff1c07a0.bottom == UIInputSetHostView:0x7fcef9d4d6b0.bottom   (active)>",
        "<NSLayoutConstraint:0x600002a87340 'UIViewSafeAreaLayoutGuide-bottom' V:[UILayoutGuide:0x60000306d340'UIViewSafeAreaLayoutGuide']-(34)-|   (active, names: '|':UIRemoteKeyboardWindow:0x7fcefa227a00 )>"
        )
        """
    
    // Single-quote mark in identifier
    static let papertrail2 = """
        (
            "<NSLayoutConstraint:0x6000037d41e0 UILabel:0x7f95b5653eb0.height == 40   (active)>",
            "<NSLayoutConstraint:0x6000037d49b0 UIImageView:0x7f95b56530e0.height == 0.9*UILabel:0x7f95b5653310.height   (active)>",
            "<NSLayoutConstraint:0x6000037dddb0 'UISV-alignment' UILabel:0x7f95b5653eb0'YOU'RE OK'.bottom == UILabel:0x7f95b5653310'Mate'.bottom   (active)>",
            "<NSLayoutConstraint:0x6000037dde00 'UISV-alignment' UILabel:0x7f95b5653eb0'YOU'RE OK'.bottom == UIImageView:0x7f95b56530e0.bottom   (active)>",
            "<NSLayoutConstraint:0x6000037dde50 'UISV-alignment' UILabel:0x7f95b5653eb0'YOU'RE OK'.top == UILabel:0x7f95b5653310'Mate'.top   (active)>",
            "<NSLayoutConstraint:0x6000037ddef0 'UISV-alignment' UILabel:0x7f95b5653eb0'YOU'RE OK'.top == UIImageView:0x7f95b56530e0.top   (active)>"
        )
        """
}
