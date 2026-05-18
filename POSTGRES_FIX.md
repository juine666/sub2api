# PostgreSQL 设置成功记录 (2026-05-14)

### 当前配置
- **版本**: PostgreSQL 15 (Homebrew)
- **端口**: `5433` (为了避开系统自带 Postgres 的 5432 冲突)
- **数据库**: `sub2api`
- **用户名**: `sub2api`
- **密码**: `change_this_secure_password` (请在 .env 中按需修改)

### 如何连接
如果你在开发应用，请将数据库连接端口设置为 `5433`：
```
DB_PORT=5433
DB_HOST=localhost
DB_USER=sub2api
DB_NAME=sub2api
```

---
### 之前的排障过程 (供参考)
1. **发现冲突**: 系统已运行 `/Library/PostgreSQL/15` (EDB 版)，占用了 5432 端口。
2. **初始化**: 发现 Homebrew 的数据目录 `/usr/local/var/postgresql@15` 未初始化，执行了 `initdb`。
3. **修改端口**: 修改 `/usr/local/var/postgresql@15/postgresql.conf` 将端口改为 `5433`。
4. **启动与创建**: 成功启动服务并创建了 `sub2api` 数据库和用户。
