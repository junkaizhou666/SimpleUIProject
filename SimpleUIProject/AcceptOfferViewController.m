#import "AcceptOfferViewController.h"

@implementation AcceptOfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置视图背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置 UI 元素
    [self setupUI];
}

// 设置 UI 元素的方法
- (void)setupUI {
    // 初始化 scrollView
    [self setupScrollView];
    
    // 布局所有 UI 元素
    [self setupTitleLabel];
    [self setupUploadSection];
    [self setupBasicInfoSection];
    [self setupAddressInfoSection];
    [self setupEmergencyContactSection];
    [self setupEducationBackgroundSection];
    [self setupWorkExperienceSection];
    [self setupSubmitButton];
    
    // 设置 scrollView 的 contentSize
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, CGRectGetMaxY(self.submitButton.frame) + 20);
}

// 设置 scrollView 方法
- (void)setupScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
}

// 设置标题标签的方法
- (void)setupTitleLabel {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    self.titleLabel.text = @"填写入职资料";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    self.titleLabel.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0]; // 淡灰色
    self.titleLabel.textColor = [UIColor darkGrayColor];
    [self.scrollView addSubview:self.titleLabel];
}

// 设置上传文件部分的方法
- (void)setupUploadSection {
    CGFloat y = CGRectGetMaxY(self.titleLabel.frame) + 15;
    
    UILabel *uploadFilesTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, y, self.view.bounds.size.width - 30, 30)];
    uploadFilesTitleLabel.text = @"上传文件";
    uploadFilesTitleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.scrollView addSubview:uploadFilesTitleLabel];
    y = CGRectGetMaxY(uploadFilesTitleLabel.frame) + 15;
    
    self.photoUploadButton = [self createUploadButtonWithTitle:@"上传个人照片" yPosition:y];
    y = CGRectGetMaxY(self.photoUploadButton.frame) + 15;
    
    self.idUploadButton = [self createUploadButtonWithTitle:@"上传身份证" yPosition:y];
    y = CGRectGetMaxY(self.idUploadButton.frame) + 15;
    
    self.resumeUploadButton = [self createUploadButtonWithTitle:@"上传简历" yPosition:y];
    y = CGRectGetMaxY(self.resumeUploadButton.frame) + 15;
}

// 设置基本信息部分的方法
- (void)setupBasicInfoSection {
    CGFloat y = CGRectGetMaxY(self.resumeUploadButton.frame) + 15;
    
    UILabel *basicInfoLabel = [self createSectionLabelWithTitle:@"基本信息" yPosition:y];
    y = CGRectGetMaxY(basicInfoLabel.frame) + 15;
    
    self.nameField = [self createTextFieldWithPlaceholder:@"姓名" yPosition:y];
    y = CGRectGetMaxY(self.nameField.frame) + 15;
    
    self.genderField = [self createTextFieldWithPlaceholder:@"性别" yPosition:y];
    y = CGRectGetMaxY(self.genderField.frame) + 15;
    
    self.dobField = [self createTextFieldWithPlaceholder:@"出生日期" yPosition:y];
    y = CGRectGetMaxY(self.dobField.frame) + 15;
    
    self.phoneField = [self createTextFieldWithPlaceholder:@"联系电话" yPosition:y];
    y = CGRectGetMaxY(self.phoneField.frame) + 15;
    
    self.emailField = [self createTextFieldWithPlaceholder:@"电子邮件地址" yPosition:y];
    y = CGRectGetMaxY(self.emailField.frame) + 15;
    
    [self.scrollView addSubview:self.nameField];
    [self.scrollView addSubview:self.genderField];
    [self.scrollView addSubview:self.dobField];
    [self.scrollView addSubview:self.phoneField];
    [self.scrollView addSubview:self.emailField];
    [self.scrollView addSubview:basicInfoLabel];
}

// 设置地址信息部分的方法
- (void)setupAddressInfoSection {
    CGFloat y = CGRectGetMaxY(self.emailField.frame) + 15;
    
    UILabel *addressInfoLabel = [self createSectionLabelWithTitle:@"地址信息" yPosition:y];
    y = CGRectGetMaxY(addressInfoLabel.frame) + 15;
    
    self.currentAddressField = [self createTextFieldWithPlaceholder:@"现居住地址" yPosition:y];
    y = CGRectGetMaxY(self.currentAddressField.frame) + 15;
    
    self.homeAddressField = [self createTextFieldWithPlaceholder:@"户籍地址" yPosition:y];
    y = CGRectGetMaxY(self.homeAddressField.frame) + 15;
    
    [self.scrollView addSubview:self.currentAddressField];
    [self.scrollView addSubview:self.homeAddressField];
    [self.scrollView addSubview:addressInfoLabel];
}

// 设置紧急联系人部分的方法
- (void)setupEmergencyContactSection {
    CGFloat y = CGRectGetMaxY(self.homeAddressField.frame) + 15;
    
    UILabel *emergencyContactLabel = [self createSectionLabelWithTitle:@"紧急联系人" yPosition:y];
    y = CGRectGetMaxY(emergencyContactLabel.frame) + 15;
    
    self.emergencyContactNameField = [self createTextFieldWithPlaceholder:@"紧急联系人姓名" yPosition:y];
    y = CGRectGetMaxY(self.emergencyContactNameField.frame) + 15;
    
    self.emergencyContactRelationField = [self createTextFieldWithPlaceholder:@"紧急联系人关系" yPosition:y];
    y = CGRectGetMaxY(self.emergencyContactRelationField.frame) + 15;
    
    self.emergencyContactPhoneField = [self createTextFieldWithPlaceholder:@"紧急联系人电话" yPosition:y];
    y = CGRectGetMaxY(self.emergencyContactPhoneField.frame) + 15;
    
    [self.scrollView addSubview:self.emergencyContactNameField];
    [self.scrollView addSubview:self.emergencyContactRelationField];
    [self.scrollView addSubview:self.emergencyContactPhoneField];
    [self.scrollView addSubview:emergencyContactLabel];
}

// 设置教育背景部分的方法
- (void)setupEducationBackgroundSection {
    CGFloat y = CGRectGetMaxY(self.emergencyContactPhoneField.frame) + 15;
    
    UILabel *educationBackgroundLabel = [self createSectionLabelWithTitle:@"教育背景" yPosition:y];
    y = CGRectGetMaxY(educationBackgroundLabel.frame) + 15;
    
    self.schoolNameField = [self createTextFieldWithPlaceholder:@"学校名称" yPosition:y];
    y = CGRectGetMaxY(self.schoolNameField.frame) + 15;
    
    self.majorField = [self createTextFieldWithPlaceholder:@"专业" yPosition:y];
    y = CGRectGetMaxY(self.majorField.frame) + 15;
    
    self.degreeField = [self createTextFieldWithPlaceholder:@"学历" yPosition:y];
    y = CGRectGetMaxY(self.degreeField.frame) + 15;
    
    self.graduationDateField = [self createTextFieldWithPlaceholder:@"毕业时间" yPosition:y];
    y = CGRectGetMaxY(self.graduationDateField.frame) + 15;
    
    [self.scrollView addSubview:self.schoolNameField];
    [self.scrollView addSubview:self.majorField];
    [self.scrollView addSubview:self.degreeField];
    [self.scrollView addSubview:self.graduationDateField];
    [self.scrollView addSubview:educationBackgroundLabel];
}

// 设置工作经验部分的方法
- (void)setupWorkExperienceSection {
    CGFloat y = CGRectGetMaxY(self.graduationDateField.frame) + 15;
    
    UILabel *workExperienceLabel = [self createSectionLabelWithTitle:@"工作经验" yPosition:y];
    y = CGRectGetMaxY(workExperienceLabel.frame) + 15;
    
    self.companyNameField = [self createTextFieldWithPlaceholder:@"公司名称" yPosition:y];
    y = CGRectGetMaxY(self.companyNameField.frame) + 15;
    
    self.positionField = [self createTextFieldWithPlaceholder:@"职位" yPosition:y];
    y = CGRectGetMaxY(self.positionField.frame) + 15;
    
    self.workDurationField = [self createTextFieldWithPlaceholder:@"工作时间" yPosition:y];
    y = CGRectGetMaxY(self.workDurationField.frame) + 15;
    
    self.jobDescriptionField = [self createTextFieldWithPlaceholder:@"主要职责" yPosition:y];
    y = CGRectGetMaxY(self.jobDescriptionField.frame) + 15;
    
    [self.scrollView addSubview:self.companyNameField];
    [self.scrollView addSubview:self.positionField];
    [self.scrollView addSubview:self.workDurationField];
    [self.scrollView addSubview:self.jobDescriptionField];
    [self.scrollView addSubview:workExperienceLabel];
}

// 设置提交按钮的方法
- (void)setupSubmitButton {
    CGFloat y = CGRectGetMaxY(self.jobDescriptionField.frame) + 15;
    
    self.submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.submitButton.frame = CGRectMake(15, y, self.view.bounds.size.width - 30, 50);
    [self.submitButton setTitle:@"提交" forState:UIControlStateNormal];
    self.submitButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.submitButton.backgroundColor = [UIColor systemBlueColor];
    [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.submitButton.layer.cornerRadius = 10;
    [self.submitButton addTarget:self action:@selector(submitButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.submitButton];
}

// 创建标签的方法
- (UILabel *)createSectionLabelWithTitle:(NSString *)title yPosition:(CGFloat)y {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, y, self.view.bounds.size.width - 30, 30)];
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:18];
    return label;
}

// 创建文本字段的方法
- (UITextField *)createTextFieldWithPlaceholder:(NSString *)placeholder yPosition:(CGFloat)y {
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, y, self.view.bounds.size.width - 30, 30)];
    textField.placeholder = placeholder;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    return textField;
}

// 创建上传按钮的方法
- (UIButton *)createUploadButtonWithTitle:(NSString *)title yPosition:(CGFloat)y {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(15, y, self.view.bounds.size.width - 30, 50);
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    button.backgroundColor = [UIColor systemGrayColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 10;
    [button addTarget:self action:@selector(uploadButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button];
    return button;
}

// 提交按钮点击事件处理方法
- (void)submitButtonTapped:(UIButton *)sender {
    // 获取各字段的值
    NSString *name = self.nameField.text;
    NSString *gender = self.genderField.text;
    NSString *dob = self.dobField.text;
    NSString *phone = self.phoneField.text;
    NSString *email = self.emailField.text;
    NSString *currentAddress = self.currentAddressField.text;
    NSString *homeAddress = self.homeAddressField.text;
    NSString *emergencyContactName = self.emergencyContactNameField.text;
    NSString *emergencyContactRelation = self.emergencyContactRelationField.text;
    NSString *emergencyContactPhone = self.emergencyContactPhoneField.text;
    NSString *schoolName = self.schoolNameField.text;
    NSString *major = self.majorField.text;
    NSString *degree = self.degreeField.text;
    NSString *graduationDate = self.graduationDateField.text;
    NSString *companyName = self.companyNameField.text;
    NSString *position = self.positionField.text;
    NSString *workDuration = self.workDurationField.text;
    NSString *jobDescription = self.jobDescriptionField.text;
    
    // 简单的表单验证
    if (name.length == 0 || gender.length == 0 || dob.length == 0 || phone.length == 0 || email.length == 0 ||
        currentAddress.length == 0 || homeAddress.length == 0 ||
        emergencyContactName.length == 0 || emergencyContactRelation.length == 0 || emergencyContactPhone.length == 0 ||
        schoolName.length == 0 || major.length == 0 || degree.length == 0 || graduationDate.length == 0 ||
        companyName.length == 0 || position.length == 0 || workDuration.length == 0 || jobDescription.length == 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:@"请填写所有必填字段" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }

    // 在这里处理表单提交的逻辑，例如发送请求到服务器
    // 示例：创建表单数据并进行网络请求
    // 例如: [self submitFormDataWithName:name gender:gender ...];
    
    // 假设处理完毕，显示成功提示
    UIAlertController *successAlert = [UIAlertController alertControllerWithTitle:@"成功" message:@"表单已提交" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [successAlert addAction:okAction];
    [self presentViewController:successAlert animated:YES completion:nil];
}


// 上传按钮点击事件处理方法
- (void)uploadButtonTapped:(UIButton *)sender {
    if (sender == self.photoUploadButton || sender == self.idUploadButton) {
        [self showImagePicker];
    } else if (sender == self.resumeUploadButton) {
        [self showDocumentPicker];
    }
}

// 显示图像选择器
- (void)showImagePicker {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = @[(NSString *)UTTypeImage.identifier]; // 使用 UTTypeImage.identifier
    [self presentViewController:imagePicker animated:YES completion:nil];
}

// 显示文档选择器
- (void)showDocumentPicker {
    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[(NSString *)UTTypePDF.identifier, (NSString *)UTTypePlainText.identifier] inMode:UIDocumentPickerModeImport];
    documentPicker.delegate = self;
    [self presentViewController:documentPicker animated:YES completion:nil];
}

@end
