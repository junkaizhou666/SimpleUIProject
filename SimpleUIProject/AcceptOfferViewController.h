#import <UIKit/UIKit.h>
#import <UniformTypeIdentifiers/UniformTypeIdentifiers.h>

// 接受Offer页面视图控制器，遵循UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIDocumentPickerDelegate协议
@interface AcceptOfferViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIDocumentPickerDelegate>

// 标题标签
@property (nonatomic, strong) UILabel *titleLabel;
// 提交按钮
@property (nonatomic, strong) UIButton *submitButton;
// 滚动视图
@property (nonatomic, strong) UIScrollView *scrollView;

// 基本信息字段
@property (nonatomic, strong) UITextField *nameField; // 姓名
@property (nonatomic, strong) UITextField *genderField; // 性别
@property (nonatomic, strong) UITextField *dobField; // 出生日期
@property (nonatomic, strong) UITextField *phoneField; // 联系电话
@property (nonatomic, strong) UITextField *emailField; // 电子邮件地址

// 地址信息字段
@property (nonatomic, strong) UITextField *currentAddressField; // 现居住地址
@property (nonatomic, strong) UITextField *homeAddressField; // 户籍地址

// 紧急联系人字段
@property (nonatomic, strong) UITextField *emergencyContactNameField; // 紧急联系人姓名
@property (nonatomic, strong) UITextField *emergencyContactRelationField; // 紧急联系人关系
@property (nonatomic, strong) UITextField *emergencyContactPhoneField; // 紧急联系人电话

// 教育背景字段
@property (nonatomic, strong) UITextField *schoolNameField; // 学校名称
@property (nonatomic, strong) UITextField *majorField; // 专业
@property (nonatomic, strong) UITextField *degreeField; // 学历
@property (nonatomic, strong) UITextField *graduationDateField; // 毕业时间

// 工作经验字段
@property (nonatomic, strong) UITextField *companyNameField; // 公司名称
@property (nonatomic, strong) UITextField *positionField; // 职位
@property (nonatomic, strong) UITextField *workDurationField; // 工作时间
@property (nonatomic, strong) UITextField *jobDescriptionField; // 主要职责

// 上传文件按钮
@property (nonatomic, strong) UIButton *photoUploadButton; // 上传个人照片按钮
@property (nonatomic, strong) UIButton *idUploadButton; // 上传身份证按钮
@property (nonatomic, strong) UIButton *resumeUploadButton; // 上传简历按钮

// 进度视图
@property (nonatomic, strong) UIProgressView *progressView;

// 用于保存选择的图片或文档的属性
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) NSURL *selectedDocumentURL;

// 方法声明
- (UILabel *)createSectionLabelWithTitle:(NSString *)title yPosition:(CGFloat)y;
- (UITextField *)createTextFieldWithPlaceholder:(NSString *)placeholder yPosition:(CGFloat)y;
- (UIButton *)createUploadButtonWithTitle:(NSString *)title yPosition:(CGFloat)y;

@end
