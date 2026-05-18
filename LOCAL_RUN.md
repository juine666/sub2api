# Sub2API 本地开发启动指南

本项目包含 Go 后端和 Vue 3 前端。请确保你的环境中已安装 Go 1.22+、Node.js 18+、PostgreSQL 15 和 Redis。

## 1. 环境准备 (macOS)

### 启动基础设施
```zsh
# 启动 Redis
brew services start redis

# 启动 PostgreSQL 15 (注意：本项目使用 5433 端口)
brew services start postgresql@15
```

### 数据库信息
- **Host**: `localhost`
- **Port**: `5433`
- **User**: `sub2api`
- **Password**: `change_this_secure_password`
- **Database**: `sub2api`

---

## 2. 启动后端 (Go)

后端服务必须从**项目根目录**启动，以便正确读取 `config.yaml`。

### 快捷启动
```zsh
./run-backend.sh
```

### 手动启动
```zsh
SERVER_PORT=8080 go run ./backend/cmd/server
```

- **API 地址**: `http://localhost:8080`
- **管理后台**: `http://localhost:8080/setup` (仅在初始化时使用)

---

## 3. 启动前端 (Vue 3)

前端开发服务器运行在 3000 端口，并自动代理 API 请求到后端的 8080 端口。

```zsh
cd frontend
pnpm install
pnpm dev
```

- **访问地址**: `http://localhost:3000`

---

## 常见问题排查 (FAQ)

### 1. 登录/注册报 403 错误？
- 确认数据库中 `settings` 表的 `registration_enabled` 是否为 `true`。
- 确认 `backend_mode_enabled` 是否为 `false`。
- 也可以直接使用安装时创建的管理员账号登录。

### 2. 前端无法连接后端？
- 检查后端是否启动在 `8080` 端口。
- 检查 `frontend/vite.config.ts` 中的 `backendUrl` 配置。

### 3. PostgreSQL 连接失败？
- 确认 PostgreSQL 15 正在运行：`pg_isready -p 5433`。
- 检查 `config.yaml` 中的数据库配置。
