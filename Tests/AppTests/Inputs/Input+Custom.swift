import Foundation

enum Input {
    
    static let custom1 = """
        (
        "<NSLayoutConstraint:0x6080004835c0 UIStackView:0x7fa4d0dece70.height == 24   (active)>",
        "<NSLayoutConstraint:0x608000687440 V:|-(21)-[UIStackView:0x7fa4d0dece70]   (active, names: '|':Proto.HeaderView:0x7fa4d0df1370 )>",
        "<NSLayoutConstraint:0x608000890860 V:[UIStackView:0x7fa4d0dece70]-(9)-|   (active, names: '|':Proto.HeaderView:0x7fa4d0df1370 )>",
        "<NSLayoutConstraint:0x600000a85d70 'UIView-Encapsulated-Layout-Height' Proto.HeaderView:0x7fa4d0df1370.height == 2.22507e-308   (active)>"
        )
        """
    
    static let custom2 = """
        (
        "<NSLayoutConstraint:0x600000685780 MyCircleView:0x7fa4d0e8b8e0.leading == name_label:0x7fa4d0e9e480.leading   (active, names: name_label:0x7fa4d0e9e480 )>",
        "<NSLayoutConstraint:0x6000006857d0 H:|-(6)-[MyCircleView:0x7fa4d0e8b8e0]   (active, names: OverViewFactorLabel:0x7fa4d0e8b450, '|':OverViewFactorLabel:0x7fa4d0e8b450 )>",
        "<NSLayoutConstraint:0x600000482e90 H:|-(0)-[name_label]   (active, names: name_label:0x7fa4d0e9e480, OverViewFactorLabel:0x7fa4d0e8b450, '|':OverViewFactorLabel:0x7fa4d0e8b450 )>"
        )
        """
    
    static let custom3 = """
        (
        "<NSLayoutConstraint:0x608000880dc0 V:[VeryLargeLabelWithBorder...]-(3)-|   (active, names: VeryLargeLabelWithBorder...:0x7fa4d60764b0, '|':UIView:0x7fa4d6079490 )>",
        "<NSLayoutConstraint:0x60800068f000 V:|-(3)-[VeryLargeLabelWithBorder...]   (active, names: VeryLargeLabelWithBorder...:0x7fa4d60764b0, '|':UIView:0x7fa4d6079490 )>",
        "<NSLayoutConstraint:0x608000695130 UIView:0x7fa4d6079060.height == 0   (active)>",
        "<NSLayoutConstraint:0x608000887620 V:[UIView:0x7fa4d6079490]-(0)-|   (active, names: '|':UIView:0x7fa4d6079060 )>",
        "<NSLayoutConstraint:0x608000699be0 V:|-(0)-[UIView:0x7fa4d6079490]   (active, names: '|':UIView:0x7fa4d6079060 )>"
        )
        """
    
    static let custom4 = """
        (
        "<_UILayoutSupportConstraint:0x1272e5820 V:[_UILayoutGuide:0x1271a5500(0)]>",
        "<_UILayoutSupportConstraint:0x1272cd510 _UILayoutGuide:0x1271a5500.bottom == UIView:0x128321830.bottom>",
        "<NSLayoutConstraint:0x127225340 V:[UICollectionView:0x126963e00(230)]>",
        "<NSLayoutConstraint:0x128325fd0 V:[UICollectionView:0x126963e00]-(87)-[_UILayoutGuide:0x1271a5500]>",
        "<NSLayoutConstraint:0x1272e51f0 'UIView-Encapsulated-Layout-Height' V:[UIView:0x128321830(568)]>",
        "<NSAutoresizingMaskLayoutConstraint:0x1272ed5f0 h=--- v=--- 'UIView-Encapsulated-Layout-Top' V:[UIView:0x128321830]-(0)-| (Names: '|':UICollectionView:0x126963e00)>"
        )
        """
    
    static let custom5 = """
        (
        "<NSAutoresizingMaskLayoutConstraint:0x60000089a130 h=--& v=--& UIView:0x7f95000e5ac0.width == 70   (active)>",
        "<NSLayoutConstraint:0x6000008989c0 DetailViewFeatureItemCell....width == 54   (active, names: DetailViewFeatureItemCell...:0x7f95000e5e50 )>",
        "<NSLayoutConstraint:0x600000898b50 DetailViewFeatureItemCell....centerX == UIView:0x7f95000e5ac0.centerX   (active, names: DetailViewFeatureItemCell...:0x7f95000e5e50 )>",
        "<NSLayoutConstraint:0x600000898c90 H:[DetailViewFeatureItemCell...]-(-2)-|   (active, names: DetailViewFeatureItemCell...:0x7f95000e5e50, '|':UIView:0x7f95000e5ac0 )>"
        )
        """
    
    static let custom6 = """
        (
        "<NSLayoutConstraint:0x608000697bb0 ListViewImage-a....width == 1.574*ListViewImage-a....height   (active, names: ListViewImage-a...:0x7f950028efe0 )>",
        "<NSLayoutConstraint:0x608000696f30 ListViewItemLabel....height == 0   (active, names: ListViewItemLabel...:0x7f950028e5b0 )>",
        "<NSLayoutConstraint:0x608000696bc0 UIView:0x7f95002902c0.height == 11   (active)>",
        "<NSLayoutConstraint:0x608000696a30 V:|-(7)-[ListViewItemLabel...]   (active, names: ListViewItemLabel...:0x7f950028e5b0, '|':UITableViewCellContentView:0x7f94fa4d7d10 )>",
        "<NSLayoutConstraint:0x608000696990 V:[ListViewItemLabel...]-(7)-[ListViewImage-a...]   (active, names: ListViewImage-a...:0x7f950028efe0, ListViewItemLabel...:0x7f950028e5b0 )>",
        "<NSLayoutConstraint:0x6080006968a0 ListViewImage-a....width == 0.4*UITableViewCellContentView:0x7f94fa4d7d10.width   (active, names: ListViewImage-a...:0x7f950028efe0 )>",
        "<NSLayoutConstraint:0x608000696760 V:[ListViewImage-a...]-(9)-[UIView:0x7f95002902c0]   (active, names: ListViewImage-a...:0x7f950028efe0 )>",
        "<NSLayoutConstraint:0x6080006966c0 V:[UIView:0x7f95002902c0]-(>=11)-[App.LineView:0x7f9500290110]   (active)>",
        "<NSLayoutConstraint:0x608000696530 V:[App.LineView:0x7f9500290110]-(0)-|   (active, names: '|':UITableViewCellContentView:0x7f94fa4d7d10 )>",
        "<NSLayoutConstraint:0x608000a99dc0 'UIView-Encapsulated-Layout-Height' UITableViewCellContentView:0x7f94fa4d7d10.height == 123.5   (active)>",
        "<NSLayoutConstraint:0x608000a99e10 'UIView-Encapsulated-Layout-Width' UITableViewCellContentView:0x7f94fa4d7d10.width == 342   (active)>"
        )
        """
    
    static let custom7 = """
        (
        "<NSLayoutConstraint:0x69c2f0 UIImageView:0x7fd382f50.height == 60>",
        "<NSLayoutConstraint:0x69a8b0 UIImageView:0x7fd382f50.top == UITableViewCell:0x7fd39b20.top>",
        "<NSLayoutConstraint:0x697ca0 UITableViewCell:0x7fd39b20.bottom == UIImageView:0x7fd382f50.bottom>",
        "<NSLayoutConstraint:0x697d40 'UIView-Encapsulated-Layout-Height' UITableViewCell:0x7fd39b20.height == 80>"
        )
        """
    
    static let custom8 = """
        (
        "<NSLayoutConstraint:0x608000696990 V:[ListViewItemLabel...]-(7)-[ListViewItemLabel...]   (active, names: ListViewItemLabel...:0x7f950028efe0, ListViewItemLabel...:0x7f950028e5b0 )>"
        )
        """
}
