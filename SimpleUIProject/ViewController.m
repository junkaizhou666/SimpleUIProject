//
//  ViewController.m
//  SimpleUIProject
//
//  Created by kaikai on 2024/8/2.
//

#import "ViewController.h"
#import "RefuseOfferViewController.h"
#import "AcceptOfferViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建公司名称标签
    UILabel *companyLabel = [[UILabel alloc] init];
    companyLabel.text = @"北京指掌易信息技术有限公司";
    companyLabel.textColor = [UIColor blackColor];
    companyLabel.textAlignment = NSTextAlignmentCenter;
    companyLabel.font = [UIFont systemFontOfSize:20];
    companyLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:companyLabel];
    
    // 创建通知书标签
    UILabel *noticeLabel = [[UILabel alloc] init];
    noticeLabel.text = @"录用通知书";
    noticeLabel.textColor = [UIColor blackColor];
    noticeLabel.textAlignment = NSTextAlignmentCenter;
    noticeLabel.font = [UIFont systemFontOfSize:20];
    noticeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:noticeLabel];
    
    // 创建 logo 图片视图
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"logo"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:imageView];
    
    // 创建带有不同样式的文本
    NSString *fullText = @"周俊凯同学\n\n恭喜您已经通过我公司入职审批，欢迎您成为公司大家庭中的一员！\n\n我们提供的聘用细节如下：\n\n一、您的工作岗位是 研发部 IOS开发实习生\n\n二、请于2024/07/24  上午9:00到公司报到（如有特殊情况无法按时报到，请提前与我们联系，否则视为自动放弃\n\n请您报到时携带以下材料：\n\n1.个人身份证原件及复印件3份（正反面同页、上下居中复印）\n\n2.学生证原件及复印件1份\n\n3.xx银行储蓄卡复印件（工资卡，需手写银行卡号并签字））";
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:fullText];
    
    // 设置特定文本的颜色
    NSString *highlightedText = @"2024/07/24  上午9:00";
    NSRange range = [fullText rangeOfString:highlightedText];
    [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    
    // 创建标签来显示文本
    UILabel *textViewLabel = [[UILabel alloc] init];
    textViewLabel.attributedText = attributedText;
    textViewLabel.numberOfLines = 0; // 自动换行
    textViewLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:textViewLabel];
    
    // 创建接受按钮
    UIButton *acceptButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [acceptButton setTitle:@"接受 OFFER" forState:UIControlStateNormal];
    [acceptButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    acceptButton.backgroundColor = [UIColor systemGreenColor];
    acceptButton.layer.cornerRadius = 8.0; // 添加圆角
    acceptButton.translatesAutoresizingMaskIntoConstraints = NO;
    [acceptButton addTarget:self action:@selector(acceptButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:acceptButton];
    
    // 创建拒绝按钮
    UIButton *rejectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rejectButton setTitle:@"拒绝 OFFER" forState:UIControlStateNormal];
    [rejectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rejectButton.backgroundColor = [UIColor systemRedColor];
    rejectButton.layer.cornerRadius = 8.0; // 添加圆角
    rejectButton.translatesAutoresizingMaskIntoConstraints = NO;
    [rejectButton addTarget:self action:@selector(rejectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rejectButton];
    
    // 添加约束
    [NSLayoutConstraint activateConstraints:@[
        // companyLabel 约束
        [companyLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [companyLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [companyLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        
        // noticeLabel 约束
        [noticeLabel.topAnchor constraintEqualToAnchor:companyLabel.bottomAnchor constant:10],
        [noticeLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [noticeLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        
        // imageView 约束
        [imageView.topAnchor constraintEqualToAnchor:noticeLabel.bottomAnchor constant:10],
        [imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [imageView.heightAnchor constraintEqualToConstant:100], // 调整 logo 的高度
        
        // textViewLabel 约束
        [textViewLabel.topAnchor constraintEqualToAnchor:imageView.bottomAnchor constant:10],
        [textViewLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [textViewLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        
        // acceptButton 约束
        [acceptButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20],
        [acceptButton.leadingAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-130],
        [acceptButton.widthAnchor constraintEqualToConstant:120],
        [acceptButton.heightAnchor constraintEqualToConstant:44],

        // rejectButton 约束
        [rejectButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20],
        [rejectButton.leadingAnchor constraintEqualToAnchor:acceptButton.trailingAnchor constant:10],
        [rejectButton.widthAnchor constraintEqualToConstant:120],
        [rejectButton.heightAnchor constraintEqualToConstant:44],
    ]];
    
    
}


// 拒绝按钮的点击事件处理
- (void)rejectButtonClicked:(UIButton *)sender {
    NSLog(@"rejectButton clicked");
    RefuseOfferViewController *refuseOfferVC = [[RefuseOfferViewController alloc] init];
    
    // 使用模态展示 RefuseOfferViewController
    [self presentViewController:refuseOfferVC animated:YES completion:nil];
}

//接受按钮的点击事件处理
- (void)acceptButtonClicked:(UIButton *)sender {
    NSLog(@"acceptButton Clicked");
    AcceptOfferViewController *acceptOfferVC = [[AcceptOfferViewController alloc] init];
    
    //使用模态展示AcceptOfferViewController
    [self presentViewController:acceptOfferVC animated:YES completion:nil];
}

@end
