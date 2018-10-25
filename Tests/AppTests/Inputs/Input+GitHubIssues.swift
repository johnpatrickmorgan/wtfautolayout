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
}
