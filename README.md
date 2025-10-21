# HTTPS3 靜態網站部署指南

## 項目概述
此項目為 `billyziiii.gofun.cloud` 域名的靜態網站部署配置，支持GitHub Pages直接託管。

## 🚀 快速部署（推薦）

### GitHub Pages 自動部署
1. 前往您的GitHub倉庫：https://github.com/billyz31/https3
2. 進入 Settings → Pages
3. 在 "Build and deployment" 部分選擇 "GitHub Actions"
4. 系統會自動檢測到 `.github/workflows/deploy.yml` 文件
5. 保存設置，每次推送到 `main` 分支時會自動部署

### 訪問地址
部署完成後，您的網站將可通過以下地址訪問：
- https://billyz31.github.io/https3/
- 或者自定義域名：https://billyziiii.gofun.cloud（需要配置CNAME）

## 🚀 快速部署

### 方法一：使用 Coolify 控制台
1. 登入 Coolify 控制台
2. 創建新應用程序
3. 選擇「從 Git 倉庫部署」或「從文件上傳」
4. 上傳本文件夾中的所有文件
5. 設置環境變數（如需要）
6. 部署應用

### 方法二：使用 Docker 直接部署
```bash
# 構建鏡像
docker build -t billyziiii-app .

# 運行容器
docker run -d \
  --name billyziiii-app \
  -p 80:80 \
  -p 443:443 \
  -v /data/coolify/certs:/etc/nginx/ssl \
  billyziiii-app
```

## 📁 文件結構
```
HTTPS3/
├── index.html          # 主頁面文件
├── nginx.conf          # Nginx 服務器配置
├── Dockerfile          # Docker 構建配置
└── README.md           # 說明文件
```

## 🔧 配置說明

### Nginx 配置
- 自動重定向 HTTP 到 HTTPS
- 啟用 HTTP/2
- 配置 SSL 證書
- 設置緩存和安全頭部
- 包含健康檢查端點

### SSL 證書
證書文件應該放置在：
- `/data/coolify/certs/billyziiii.gofun.cloud.cert`
- `/data/coolify/certs/billyziiii.gofun.cloud.key`

## 🌐 訪問地址
- 主頁: https://billyziiii.gofun.cloud
- 健康檢查: https://billyziiii.gofun.cloud/health

## 📊 監控和日誌
- 訪問日誌: `/var/log/nginx/access.log`
- 錯誤日誌: `/var/log/nginx/error.log`

## 🔒 安全特性
- HTTPS 強制重定向
- 安全頭部設置 (X-Frame-Options, X-Content-Type-Options, etc.)
- 現代 TLS 配置
- Gzip 壓縮啟用

## 🛠️ 故障排除

### 常見問題
1. **SSL 證書錯誤**: 檢查證書文件權限和路徑
2. **403 Forbidden**: 檢查文件權限
3. **502 Bad Gateway**: 檢查 Nginx 是否正常運行

### 日誌檢查
```bash
docker logs billyziiii-app
tail -f /var/log/nginx/error.log
```

## 📞 支持
如有問題，請檢查：
1. Coolify 文檔
2. Nginx 錯誤日誌
3. Docker 容器日誌

---
**成功部署！** 🎉 您的網站現在應該可以通過 https://billyziiii.gofun.cloud 訪問。