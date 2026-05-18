#!/bin/zsh

# 检查 Redis
if ! brew services list | grep redis | grep started > /dev/null; then
    echo "正在启动 Redis..."
    brew services start redis
fi

# 检查 PostgreSQL
if ! brew services list | grep postgresql@15 | grep started > /dev/null; then
    echo "正在启动 PostgreSQL@15..."
    brew services start postgresql@15
fi

echo "----------------------------------------"
echo "正在启动后端服务 (Sub2API Backend)..."
echo "使用配置文件: ./config.yaml"
echo "数据库端口: 5433"
echo "----------------------------------------"

cd backend
go run ./cmd/server
