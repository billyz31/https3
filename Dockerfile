# 使用官方Nginx Alpine鏡像（輕量級）
FROM nginx:alpine

# 設置維護者信息
LABEL maintainer="billyziiii.gofun.cloud"

# 創建應用目錄
RUN mkdir -p /app/public

# 複製靜態文件到容器中
COPY index.html /app/public/index.html

# 複製Nginx配置
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露端口
EXPOSE 80
EXPOSE 443

# 健康檢查
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/health || exit 1

# 啟動Nginx
CMD ["nginx", "-g", "daemon off;"]