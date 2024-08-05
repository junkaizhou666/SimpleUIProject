//
//  RefuseOfferViewController.m
//  SimpleUIProject
//
//  Created by kaikai on 2024/8/2.
//

#import "RefuseOfferViewController.h"

@interface RefuseOfferViewController ()

@end

@implementation RefuseOfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 配置 SecondViewController 的视图背景颜色为白色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建 UILabel 实例并配置
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"尊敬的周俊凯，\n\n感谢你及时回复我们的Offer，并告知我们你的决定。虽然我们对你无法加入我们团队感到遗憾，但我们尊重你的选择，并祝愿你在未来的职业道路上一切顺利。\n\n如果将来有任何机会希望合作，欢迎随时联系我们。再次感谢你对北京指掌易信息技术有限公司的关注！\n\n祝好，\n\n[徐楚凌]\n[HRBP]\n北京指掌易信息技术有限公司";
    label.numberOfLines = 0; // 允许多行显示
    label.lineBreakMode = NSLineBreakByWordWrapping; // 单词换行
    label.textAlignment = NSTextAlignmentLeft; // 文本左对齐
    label.font = [UIFont fontWithName:@"Avenir" size:21]; // 字体大小调整为 21
    label.textColor = [UIColor blackColor]; // 字体颜色
    label.backgroundColor = [UIColor clearColor]; // 背景透明
    
    // 创建 UIImageView 实例并配置
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit; // 图片自适应缩放
    
    // 添加 UILabel 和 UIImageView 到视图中
    [self.view addSubview:label];
    [self.view addSubview:imageView];
    
    // 使用 Auto Layout 进行布局
    label.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [label.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [label.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100],
        
        [imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [imageView.topAnchor constraintEqualToAnchor:label.bottomAnchor constant:20],
        [imageView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20],
        [imageView.heightAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.25] // 图片高度与宽度成比例
    ]];
}


@end
