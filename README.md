# TrollStore iOS App

可用于 TrollStore (巨魔) 自签的 iOS 应用项目

## 功能特性

- ✅ 无需开发者账号
- ✅ 永久签名保留
- ✅ 支持自定义应用
- ✅ 快速安装部署

## 环境要求

- macOS 12.0+
- Xcode 14.0+
- iOS 14.0+

## 快速开始

### 方法 1: 使用构建脚本

```bash
chmod +x build.sh
./build.sh
```

### 方法 2: 使用 Xcode

1. 打开 `TrollStoreApp.xcodeproj`
2. 选择目标设备
3. 点击 Build 或按 ⌘B
4. 在 Xcode 中找到生成的 IPA 文件

## IPA 文件位置

构建完成后，IPA 文件位于:
```
build/DerivedData/Build/Products/Release-iphoneos/TrollStoreApp.ipa
```

## 使用 TrollStore 安装

1. 在越狱设备上安装 TrollStore
2. 使用 TrollStore 打开 IPA 文件
3. 点击安装 (自动进行无证书签名)
4. 等待安装完成

## 项目结构

```
ios-trollstore-app/
├── TrollStoreApp/
│   ├── TrollStoreAppApp.swift      # App 主入口
│   └── ContentView.swift            # 主界面
├── Info.plist                       # 应用配置
├── build.sh                         # 构建脚本
└── README.md                        # 项目说明
```

## 自定义应用

### 修改应用名称

编辑 `Info.plist`:
```xml
<key>CFBundleName</key>
<string>你的应用名</string>
```

### 修改包标识符

```xml
<key>CFBundleIdentifier</key>
<string>com.your.bundle.id</string>
```

### 修改界面

编辑 `ContentView.swift` 文件来自定义应用界面。

## 注意事项

⚠️ **重要提示**:
- 仅用于学习和测试目的
- 需要 iOS 设备已越狱
- TrollStore 仅在特定 iOS 版本上支持
- 确保遵守当地法律法规

## 常见问题

**Q: 没有越狱设备可以使用吗?**
A: 不可以。TrollStore 自签功能需要越狱环境。

**Q: 支持哪些 iOS 版本?**
A: iOS 14.0+ (具体取决于越狱工具支持)

**Q: IPA 文件过大如何优化?**
A: 可以移除不必要的资源和框架，使用 app thinning。

## 更多资源

- [TrollStore 官方](https://github.com/opa334/TrollStore)
- [Swift 官方文档](https://swift.org/documentation/)
- [Apple Developer](https://developer.apple.com/)

## 许可证

MIT License

---

**最后更新**: 2026-08-31
