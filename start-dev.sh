#!/bin/zsh

# Sub2API 一键启动开发环境脚本

echo "🚀 正在启动 Sub2API 开发环境..."

# 1. 启动基础设施
echo "🐘 正在检查 PostgreSQL..."
brew services start postgresql@15
echo "缓存 正在检查 Redis..."
brew services start redis

# 等待数据库就绪
sleep 2

# 2. 启动后端 (在后台运行)
echo "⚙️ 正在启动后端服务 (8080 端口)..."
SERVER_PORT=8080 ./run-backend.sh > backend.log 2>&1 &
BACKEND_PID=$!

# 3. 启动前端
echo "🌐 正在启动前端开发服务器 (3000 端口)..."
echo "💡 提示：后端日志请查看 backend.log"
cd frontend && pnpm dev

# 当前端退出时，自动关闭后端
trap "kill $BACKEND_PID" EXIT
