#!/bin/bash

# TrollStore IPA 打包脚本
# 用途: 为 TrollStore 自签构建 IPA 文件

set -e

echo "=== TrollStore App IPA 构建脚本 ==="
echo ""

# 检查 Xcode 是否已安装
if ! command -v xcodebuild &> /dev/null; then
    echo "❌ 错误: 未找到 Xcode。请先安装 Xcode。"
    exit 1
fi

echo "✓ 检测到 Xcode"

# 获取当前目录
PROJECT_DIR="$(pwd)"
PROJECT_NAME="TrollStoreApp"
BUILD_DIR="${PROJECT_DIR}/build"
DERIVED_DATA="${BUILD_DIR}/DerivedData"

# 清理旧构建
echo "正在清理旧构建..."
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"

# 构建应用
echo "正在构建 iOS 应用..."
xcodebuild -scheme "${PROJECT_NAME}" \
    -configuration Release \
    -derivedDataPath "${DERIVED_DATA}" \
    -arch arm64 \
    clean build

echo ""
echo "✓ 构建完成"
echo ""
echo "后续步骤:"
echo "1. 打开 TrollStore 应用"
echo "2. 使用巨魔工具进行自签"
echo "3. 将生成的 IPA 文件安装到设备"
echo ""
echo "构建输出位置: ${BUILD_DIR}"
