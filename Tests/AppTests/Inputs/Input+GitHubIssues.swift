import Foundation

extension Input {
    
    /// https://github.com/johnpatrickmorgan/wtfautolayout/issues/1
    static let issue1 = """
        (
        "<NSLayoutConstraint:0x17468b860 progress background.height == 5   (active, names: progress background:0x1089a5290 )>"
        )
        """
    
    /// https://github.com/johnpatrickmorgan/wtfautolayout/issues/2
    static let issue2 = """
        (
        "<NSAutoresizingMaskLayoutConstraint:0x181af7c0 AWPProductOnMapView:0x4dbb090.height == 234>",
        "<NSLayoutConstraint:0x181cef70 UIImageView:0x4db3270.width == UIImageView:0x4db3270.height * 0.384615>",
        "<NSLayoutConstraint:0x181d2d20 UIImageView:0x4db3270.width == 85>",
        "<NSLayoutConstraint:0x4dc7b00 UIView:0x4db5710.bottom == UIImageView:0x4db3270.bottom + 25>",
        "<NSLayoutConstraint:0x4dc7bd0 UIImageView:0x4db3270.top == UIView:0x4db5710.top + 2>",
        "<NSLayoutConstraint:0x4dc85a0 AWPProductOnMapView:0x4dbb090.bottom == UIView:0x4db5710.bottom>",
        "<NSLayoutConstraint:0x4dc8630 UIView:0x4db5710.top == AWPProductOnMapView:0x4dbb090.top>"
        )
        """
    
    /// https://github.com/johnpatrickmorgan/wtfautolayout/issues/4
    static let issue4 = """
        (
        "<SnapKit.LayoutConstraint:0x6000002b2660@CCBaseCell.swift#88 NSKVONotifying_LQRoundedCornerView:0x7ff92c7ec1f0.height >= 44.0>",
        "<SnapKit.LayoutConstraint:0x6000004ad800@CCBaseCell.swift#91 UIView:0x7ff92c7ec3c0.height == 1.0>",
        "<SnapKit.LayoutConstraint:0x6000006ae880@CCBaseCell.swift#97 UIView:0x7ff92c7ec560.height == UIView:0x7ff92c7ec3c0.height>",
        "<SnapKit.LayoutConstraint:0x6000006aa0e0@CCBaseCell.swift#100 UIView:0x7ff92c7ec560.centerY == NSKVONotifying_LQRoundedCornerView:0x7ff92c7ec1f0.bottom>",
        "<SnapKit.LayoutConstraint:0x6080006ad4a0@CCTargetCells.swift#43 UIView:0x7ff92e29e6f0.top == NSKVONotifying_LQRoundedCornerView:0x7ff92c7ec1f0.top>",
        "<SnapKit.LayoutConstraint:0x6080004a6e40@CCTargetCells.swift#44 UIView:0x7ff92e29e6f0.bottom == UIView:0x7ff92c7ec560.bottom>",
        "<SnapKit.LayoutConstraint:0x6080002b2fc0@CCTargetCells.swift#142 UILabel:0x7ff92c74c9e0.top == UIView:0x7ff92e29e6f0.topMargin>",
        "<SnapKit.LayoutConstraint:0x6080008a2a60@CCTargetCells.swift#143 UILabel:0x7ff92c74c9e0.firstBaseline == UIView:0x7ff92e29e6f0.bottomMargin>"
        )
        """
    
    /// https://github.com/johnpatrickmorgan/wtfautolayout/issues/5
    static let issue5 = """
        (
        "<NSLayoutConstraint:0x170490e00 UIScrollView:0x1241d1200.left == LingQ.LQScrollingStackView:0x123ed1070.left>",
        "<NSLayoutConstraint:0x170490ea0 UIScrollView:0x1241d1200.right == LingQ.LQScrollingStackView:0x123ed1070.right>",
        "<SnapKit.LayoutConstraint:0x1706b8600@LLAchievementsCells.swift#222 LingQ.LQScrollingStackView:0x123ed1070.left == NSKVONotifying_LQRoundedCornerView:0x123d8da90.leftMargin>",
        "<SnapKit.LayoutConstraint:0x1706b86c0@LLAchievementsCells.swift#222 LingQ.LQScrollingStackView:0x123ed1070.right == NSKVONotifying_LQRoundedCornerView:0x123d8da90.rightMargin>",
        "<SnapKit.LayoutConstraint:0x1706b9260@LLAchievementsCells.swift#203 UIImageView:0x123d8e1f0.width == NSKVONotifying_LQRoundedCornerView:0x123d8da90.width * 0.25>",
        "<NSLayoutConstraint:0x1742812c0 LingQ.LLBadgeView:0x123d8e020.trailing == _UILayoutSpacer:0x1743a0620.trailing>",
        "<NSLayoutConstraint:0x174281450 LingQ.LLBadgeView:0x123d8e020.centerX == UIImageView:0x123d8e1f0.centerX>",
        "<NSLayoutConstraint:0x1704918f0 LingQ.LLBadgeView:0x123d8e020.width == 0>",
        "<NSLayoutConstraint:0x174281400 _UILayoutSpacer:0x1743a0620.trailing >= UIImageView:0x123d8e1f0.trailing>"
        )
        """
    
    /// https://github.com/johnpatrickmorgan/wtfautolayout/issues/10
    static let issue10 = """
    (
        "<NSLayoutConstraint:0x60000346c9b0 UITextField:0x7fa67503ae00.height == 50   (active)>",
        "<NSLayoutConstraint:0x60000346d720 V:|-(0)-[UITextField:0x7fa67503ae00]   (active, names: '|':UIView:0x7fa67350cab0 )>",
        "<NSLayoutConstraint:0x60000346d7c0 V:[UITextField:0x7fa67503ae00]-(0)-|   (active, names: '|':UIView:0x7fa67350cab0 )>",
        "<NSLayoutConstraint:0x60000346dbd0 UITableViewCellContentView:0x7fa67350b050.bottomMargin == UIStackView:0x7fa67350c480.bottom   (active)>",
        "<NSLayoutConstraint:0x60000346dc20 UIStackView:0x7fa67350c480.top == UITableViewCellContentView:0x7fa67350b050.topMargin   (active)>",
        "<NSLayoutConstraint:0x600003459680 'UISV-alignment' UIImageView:0x7fa67350c880.centerY == UIView:0x7fa67350cab0.centerY   (active)>",
        "<NSLayoutConstraint:0x60000345ac10 'UISV-canvas-connection' UIStackView:0x7fa67350c680.top == _UILayoutSpacer:0x60000284c1e0'UISV-alignment-spanner'.top   (active)>",
        "<NSLayoutConstraint:0x60000345a440 'UISV-canvas-connection' UIStackView:0x7fa67350c680.centerY == UIImageView:0x7fa67350c880.centerY   (active)>",
        "<NSLayoutConstraint:0x600003458320 'UISV-canvas-connection' UIStackView:0x7fa67350c480.top == UIStackView:0x7fa67350c680.top   (active)>",
        "<NSLayoutConstraint:0x6000034757c0 'UISV-canvas-connection' V:[UIButton:0x7fa67350bf50'E-posta adresini mi unutt...']-(0)-|   (active, names: '|':UIStackView:0x7fa67350c480 )>",
        "<_UISystemBaselineConstraint:0x6000033499e0 'UISV-spacing' V:[UIStackView:0x7fa67350c680]-(NSLayoutAnchorConstraintSpace(8))-[UIButton:0x7fa67350bf50'E-posta adresini mi unutt...']   (active)>",
        "<NSLayoutConstraint:0x6000034679d0 'UISV-spanning-boundary' _UILayoutSpacer:0x60000284c1e0'UISV-alignment-spanner'.top <= UIView:0x7fa67350cab0.top   (active)>",
        "<NSLayoutConstraint:0x60000346ddb0 'UIView-bottomMargin-guide-constraint' V:[UILayoutGuide:0x600002e401c0'UIViewLayoutMarginsGuide']-(8)-|   (active, names: '|':UITableViewCellContentView:0x7fa67350b050 )>",
        "<NSLayoutConstraint:0x60000346d590 'UIView-Encapsulated-Layout-Height' UITableViewCellContentView:0x7fa67350b050.height == 66   (active)>",
        "<NSLayoutConstraint:0x60000346dd10 'UIView-topMargin-guide-constraint' V:|-(8)-[UILayoutGuide:0x600002e401c0'UIViewLayoutMarginsGuide']   (active, names: '|':UITableViewCellContentView:0x7fa67350b050 )>"
    )
    """
    
    static let issue13 = """
        "<NSAutoresizingMaskLayoutConstraint:0x283c8f570 h=-&- v=&-- UIView:0x10f754f20.height == 86   (active)>",
        "<NSLayoutConstraint:0x283c8c820 V:|-(0)-[UIButton:0x10f755100'Cancel']   (active, names: '|':UIView:0x10f754f20 )>",
        "<NSLayoutConstraint:0x283c8c870 UIButton:0x10f755100'Cancel'.height == 52   (active)>",
        "<NSLayoutConstraint:0x283c8c8c0 UILayoutGuide:0x2826f9880'UIViewLayoutMarginsGuide'.bottom == UIButton:0x10f755100'Cancel'.bottom NSSpace(0)   (active)>",
        "<NSLayoutConstraint:0x283c8c730 'UIView-bottomMargin-guide-constraint' V:[UILayoutGuide:0x2826f9880'UIViewLayoutMarginsGuide']-(42)-|   (active, names: '|':UIView:0x10f754f20 )>"
    """
    
    static let issue16 = """
        "<SnapKit.LayoutConstraint:0x7feb4e8fa260@PViewController+Ext.swift#21 App_Debug.StackView:0x7feb4e8d58b0.leading == UILayoutGuide:0x7feb50d2aa70.leading + 10.0>"
    """
    
    static let issue18 = """
        "<NSLayoutConstraint:0x600001707c50 UIStackView:0x7fed434775c0.width == UIScrollView:0x7fed24024000.width   (active)>",
        "<NSLayoutConstraint:0x6000017e8e60 'UISV-alignment' UILabel:0x7fed2355f060'Please keep this key in a...'.leading == _TtGC8MyAppXYZ8CardViewCS_P10$10582914415RecoveryKeyView_:0x7fed43476280.leading   (active)>",
        "<NSLayoutConstraint:0x6000017e8ff0 'UISV-alignment' UILabel:0x7fed2355f060'Please keep this key in a...'.trailing == _TtGC8MyAppXYZ8CardViewCS_P10$10582914415RecoveryKeyView_:0x7fed43476280.trailing   (active)>",
        "<NSLayoutConstraint:0x6000017e8dc0 'UISV-canvas-connection' UILayoutGuide:0x600000d7ea00'UIViewLayoutMarginsGuide'.trailing == UILabel:0x7fed2355f060'Please keep this key in a...'.trailing   (active)>",
        "<NSLayoutConstraint:0x6000017e8be0 'UISV-canvas-connection' UILayoutGuide:0x600000d7ea00'UIViewLayoutMarginsGuide'.leading == UILabel:0x7fed2355f060'Please keep this key in a...'.leading   (active)>",
        "<NSLayoutConstraint:0x6000017e9130 'UIView-Encapsulated-Layout-Width' UIScrollView:0x7fed24024000.width == 0   (active)>",
        "<NSLayoutConstraint:0x6000017e8a00 'UIView-leftMargin-guide-constraint' H:|-(22)-[UILayoutGuide:0x600000d7ea00'UIViewLayoutMarginsGuide'](LTR)   (active, names: '|':UIStackView:0x7fed434775c0 )>",
        "<NSLayoutConstraint:0x6000017e8aa0 'UIView-rightMargin-guide-constraint' H:[UILayoutGuide:0x600000d7ea00'UIViewLayoutMarginsGuide']-(22)-|(LTR)   (active, names: '|':UIStackView:0x7fed434775c0 )>"
        """
    
    static let issue20 = """
    (
        "<_UISystemBaselineConstraint:0x2828051d0 V:|-(>=NSLayoutAnchorConstraintSpace(8))-[UILabel:0x111b35c20]   (active, names: '|':ModuleName.ClassName:0x111b35a60 )>",
        "<NSLayoutConstraint:0x282805130 UILabel:0x111b35c20.centerY == ModuleName.ClassName:0x111b35a60.centerY   (active)>",
        "<NSLayoutConstraint:0x282803ed0 'UIView-Encapsulated-Layout-Height' ModuleName.ClassName:0x111b35a60.height == 0   (active)>"
    )
    """
}
