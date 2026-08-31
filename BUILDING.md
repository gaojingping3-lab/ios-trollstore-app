# 详细构建指南

## 前置准备

### 1. 安装 Xcode

```bash
# 通过 App Store 安装 Xcode (推荐)
# 或者使用命令行工具
xcode-select --install
```

### 2. 克隆项目

```bash
git clone https://github.com/gaojingping3-lab/ios-trollstore-app.git
cd ios-trollstore-app
```

## 构建步骤

### 步骤 1: 打开项目

```bash
open TrollStoreApp.xcodeproj
```

### 步骤 2: 配置项目设置

在 Xcode 中:
1. 选择项目文件
2. 在 "General" 标签中配置:
   - Bundle Identifier: `com.trollstore.sideload`
   - Version: `1.0`
   - Build: `1`
   - Deployment Target: `iOS 14.0`

### 步骤 3: 选择目标

1. 在 Xcode 顶部选择 "TrollStoreApp" scheme
2. 选择目标设备或模拟器

### 步骤 4: 构建

**快捷键**: ⌘B (Build)

或在菜单中: Product → Build

### 步骤 5: 获取 IPA 文件

构建成功后，在 Xcode 中:

1. 菜单: Product → Show Build Folder in Finder
2. 导航到: DerivedData → TrollStoreApp-xxx → Build → Products → Release-iphoneos
3. 右键点击 "TrollStoreApp.app" → "创建应用包副本"
4. 选择输出位置并命名为 "TrollStoreApp.ipa"

## 命令行构建 (可选)

### 直接构建

```bash
xcodebuild -project TrollStoreApp.xcodeproj \
    -scheme TrollStoreApp \
    -configuration Release \
    -arch arm64 \
    build
```

### 使用脚本构建

```bash
chmod +x build.sh
./build.sh
```

## 生成 IPA 包

### 方法 1: 使用 xcodebuild 和 xcrun

```bash
# 1. 构建应用
xcodebuild archive -project TrollStoreApp.xcodeproj \
    -scheme TrollStoreApp \
    -configuration Release \
    -archivePath ./TrollStoreApp.xcarchive

# 2. 导出为 IPA
xcrun -sdk iphoneos PackageApplication -v \
    ./TrollStoreApp.xcarchive/Products/Applications/TrollStoreApp.app \
    -o ./TrollStoreApp.ipa
```

### 方法 2: 使用 Xcode UI

1. 菜单: Product → Archive
2. 在弹出窗口中选择最新的 archive
3. 点击 "Distribute App"
4. 选择 "Ad Hoc"
5. 选择签名身份 (可选)
6. 选择保存位置并完成导出

## 签名配置

### 自动签名 (推荐)

1. 在 Xcode 项目设置中
2. 选择 "Signing & Capabilities"
3. 启用 "Automatically manage signing"
4. 选择你的 Team

### 手动签名 (用于 TrollStore)

1. 禁用自动签名
2. 在 Code Signing Identity 中选择 "AD Hoc" 或 "Development"
3. 配置 Provisioning Profile

## 测试构建

### 在模拟器上测试

```bash
xcodebuild -project TrollStoreApp.xcodeproj \
    -scheme TrollStoreApp \
    -configuration Debug \
    -sdk iphonesimulator \
    build
```

### 在真机上测试

1. 连接 iOS 设备
2. 在 Xcode 中选择设备
3. 点击 Run (⌘R)

## 常见构建问题

### 问题 1: "No signing identity found"

**解决**:
```bash
# 列出可用的签名身份
security find-identity -v -p codesigning

# 如果没有，创建自签名证书
codesign --deep --force --verify --verbose --sign - TrollStoreApp.app
```

### 问题 2: "Provisioning profile not found"

**解决**:
1. 在 Xcode 中重新配置签名
2. 或使用 Ad Hoc 配置文件

### 问题 3: "Architecture arm64 not found"

**解决**:
```bash
# 确保目标架构正确
xcodebuild -showsdks

# 选择正确的 SDK
xcodebuild -sdk iphoneos
```

## 优化 IPA 大小

### 1. 启用 Bitcode

在 Build Settings 中:
- Enable Bitcode: YES

### 2. 移除不必要的资源

- 删除未使用的图片资源
- 删除未使用的框架
- 使用 Asset Catalog 优化

### 3. 启用 Strip Linked Product

Build Settings → Strip Linked Product: YES

### 4. 优化框架

```bash
# 分析 IPA 大小
unzip -l TrollStoreApp.ipa | sort -k4 -n
```

## 用于 TrollStore 的特殊配置

### 1. 禁用代码签名验证

Info.plist 中添加:
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

### 2. 设置权限

在 Entitlements.plist 中配置所需权限。

### 3. 为 TrollStore 优化

- 移除代码签名要求
- 禁用沙箱限制 (仅限 TrollStore 环境)
- 配置 get-task-allow

## 验证构建

```bash
# 检查 IPA 结构
unzip -t TrollStoreApp.ipa

# 验证签名
codesign -v TrollStoreApp.app

# 查看应用信息
mdls TrollStoreApp.app | grep -i bundle
```

## 后续步骤

1. ✅ IPA 文件已生成
2. 📱 将设备连接到 TrollStore
3. 🔄 使用 TrollStore 应用进行自签
4. ⬆️ 安装到设备
5. 🎉 完成!

---

需要帮助? 查看 README.md 或官方文档。
