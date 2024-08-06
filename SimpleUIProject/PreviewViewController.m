//
//  PreviewViewController.m
//  SimpleUIProject
//
//  Created by kaikai on 2024/8/6.
//

#import "PreviewViewController.h"

@interface PreviewViewController ()

@property (nonatomic, strong) UIScrollView *scrollView; // 用于滚动视图
@property (nonatomic, strong) UILabel *previewLabel; // 用于显示预览内容的标签

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化和配置滚动视图
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.scrollView];
    
    // 设置滚动视图的约束
    [NSLayoutConstraint activateConstraints:@[
        [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
    
    // 初始化和配置预览标签
    self.previewLabel = [[UILabel alloc] init];
    self.previewLabel.numberOfLines = 0;
    self.previewLabel.textAlignment = NSTextAlignmentLeft;
    self.previewLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.previewLabel];
    
    // 设置预览标签的约束
    [NSLayoutConstraint activateConstraints:@[
        [self.previewLabel.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor constant:20],
        [self.previewLabel.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:20],
        [self.previewLabel.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:-20],
        [self.previewLabel.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor constant:-20],
        [self.previewLabel.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor constant:-40]
    ]];
    
    [self displayFormData];
}

- (void)displayFormData {
    // 定义一个数组来确定键的显示顺序
    NSArray<NSString *> *keysOrder = @[
        @"姓名", @"性别", @"出生日期", @"联系电话", @"电子邮件地址",
        @"现居住地址", @"户籍地址", @"紧急联系人姓名", @"紧急联系人关系",
        @"紧急联系人电话", @"学校名称", @"专业", @"学历",
        @"毕业时间", @"公司名称", @"职位", @"工作时间", @"主要职责"
    ];
    
    NSMutableString *text = [NSMutableString string];
    for (NSString *key in keysOrder) {
        NSString *value = self.formData[key];
        if (value) {
            [text appendFormat:@"%@: %@\n\n", key, value];
        }
    }
    self.previewLabel.text = text;
    
    // 计算标签内容的高度并更新滚动视图的内容大小
    CGSize maxSize = CGSizeMake(self.previewLabel.bounds.size.width, CGFLOAT_MAX);
    CGSize requiredSize = [self.previewLabel sizeThatFits:maxSize];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, requiredSize.height + 40); // 40用于上下的内边距
}

@end
