MyJPress 是一个功能强大的开源 CMS（内容管理系统）建站系统，基于 Java 技术栈开发，支持多站点、多语言、插件扩展等企业级功能。

## 🚀 主要特性

### 核心功能
- **多站点支持**：支持在同一个系统中运行多个独立站点
- **模板引擎**：灵活的模板系统，支持在线切换主题
- **插件系统**：强大的插件扩展机制，支持功能动态扩展
- **多语言支持**：内置多语言支持，可轻松实现网站国际化
- **响应式设计**：完美支持PC端和移动端访问

### 内容管理
- **文章管理**：支持分类、标签、评论等功能
- **页面管理**：自定义页面，支持自定义模板
- **产品管理**：产品展示和管理功能
- **表单系统**：灵活的表单收集和管理
- **附件管理**：统一的文件存储和管理系统

### 用户系统
- **用户管理**：完整的用户注册、登录、管理功能
- **角色权限**：基于RBAC的权限管理系统
- **第三方登录**：支持微信、QQ等第三方登录
- **会员体系**：可扩展的会员等级体系

### 微信功能
- **公众号集成**：支持微信公众号管理
- **自动回复**：智能的微信消息回复系统
- **菜单管理**：可视化的公众号菜单管理
- **支付功能**：支持微信支付功能

## 🛠 技术架构

### 系统架构图

```
+------------------+  +------------------+  +------------------+
|     浏览器       |  |     微信         |  |     APP         |
+--------+---------+  +--------+---------+  +--------+---------+
         |                     |                     |
         +----------+----------)----------+----------+
                    |                    |
         +----------v--------------------v----------+
         |               Nginx/负载均衡             |
         +----------+--------------------+----------+
                    |                    |
    +---------------v--+          +------v---------+
    |  JPress节点 1    |          |  JPress节点 2   |
    |                  |          |                |
    | +--------------+ |          | +------------+ |
    | |   模板引擎    | |          | |  模板引擎   | |
    | +--------------+ |          | +------------+ |
    |                  |          |                |
    | +--------------+ |          | +------------+ |
    | |   插件系统    | |          | |  插件系统   | |
    | +--------------+ |          | +------------+ |
    |                  |          |                |
    | +--------------+ |          | +------------+ |
    | |   核心模块    | |          | |  核心模块   | |
    | +--------------+ |          | +------------+ |
    +--------+---------+          +-------+--------+
             |                            |
     +-------v----------------------------v-------+
     |                消息队列                    |
     +-------+----------------------------+-------+
             |                            |
    +--------v---------+          +------v---------+
    |    数据库集群     |          |    缓存集群     |
    | (MySQL主从/分片)  |          | (Redis集群)    |
    +------------------+          +----------------+
             |                            |
    +--------v---------+          +------v---------+
    |  文件存储服务     |          |   搜索服务      |
    | (OSS/COS等)      |          | (Elasticsearch)|
    +------------------+          +----------------+
```

### 架构说明

1. **接入层**
   - 支持多种客户端接入：Web浏览器、微信、移动APP
   - 使用Nginx进行负载均衡和反向代理
   - 支持SSL证书和HTTPS访问

2. **应用层**
   - 多节点部署，支持水平扩展
   - 每个节点包含完整的JPress功能
   - 模板引擎支持热加载
   - 插件系统支持动态扩展
   - 核心模块提供基础功能支持

3. **服务层**
   - 消息队列：处理异步任务和系统解耦
   - 分布式缓存：Redis集群
   - 数据库集群：MySQL主从或分片
   - 文件存储：支持本地和云存储
   - 搜索服务：可选Elasticsearch

4. **基础设施**
   - 监控告警系统
   - 日志收集系统
   - 运维管理系统
   - 备份恢复系统

5. **安全体系**
   - 网络安全：WAF防护
   - 应用安全：认证授权
   - 数据安全：加密传输
   - 运维安全：操作审计

### 技术组件详解

```
+-------------------------------------------------------------------------+
|                           JPress 技术组件架构                             |
+-------------------------------------------------------------------------+
|                                                                         |
|  +----------------+  +----------------+  +----------------+             |
|  |   请求处理层    |  |    业务处理层   |  |    数据访问层   |             |
|  +----------------+  +----------------+  +----------------+             |
|  | - Undertow     |  | - Spring IoC  |  | - JFinal ORM  |             |
|  | - Tomcat       |  | - AOP         |  | - Sharding    |             |
|  | - Nginx        |  | - 事务管理     |  | - 读写分离     |             |
|  +----------------+  +----------------+  +----------------+             |
|                                                                         |
|  +----------------+  +----------------+  +----------------+             |
|  |   缓存系统      |  |    消息系统    |  |    存储系统    |             |
|  +----------------+  +----------------+  +----------------+             |
|  | - Redis集群    |  | - RocketMQ    |  | - MySQL集群   |             |
|  | - EHCACHE      |  | - WebSocket   |  | - OSS/COS    |             |
|  | - 多级缓存      |  | - 消息队列     |  | - ES集群      |             |
|  +----------------+  +----------------+  +----------------+             |
|                                                                         |
+-------------------------------------------------------------------------+
```

#### 核心组件说明

1. **Web服务器**
   - Undertow：高性能非阻塞Web服务器
     - 支持HTTP/2
     - WebSocket支持
     - 非阻塞IO处理
   - Tomcat：传统Web容器
     - 成熟稳定
     - 配置灵活
     - 监控完善
   - Nginx：反向代理
     - 负载均衡
     - SSL终止
     - 静态资源缓存
   
2. **业务框架**
   - IoC容器：
     - 依赖注入
     - 组件解耦
     - 生命周期管理
   - AOP框架：
     - 事务处理
     - 日志记录
     - 权限控制
   - 事务管理：
     - 本地事务
     - 分布式事务
     - 事务补偿

3. **数据访问**
   - JFinal ORM：
     - 轻量级设计
     - 易于使用
     - 性能优异
   - 分库分表：
     - 水平拆分
     - 垂直拆分
     - 分片策略
   - 读写分离：
     - 主从配置
     - 负载均衡
     - 故障转移

### 数据流向图

```
+-------------+     +-------------+     +-------------+
|  用户请求    | --> |  负载均衡   | --> |  应用服务器  |
+-------------+     +-------------+     +-------------+
                                              |
                                              v
+-----------------+   +-----------------+   +-------------+
| 静态资源(CDN)    | <-|    缓存层       | <-|  业务处理    |
+-----------------+   +-----------------+   +-------------+
                                              |
                                              v
+-----------------+   +-----------------+   +-------------+
| 对象存储服务     | <-|    消息队列     | <-| 数据持久化   |
+-----------------+   +-----------------+   +-------------+
```

#### 数据流向详解

1. **请求处理流程**
   ```
   用户请求 -> Nginx负载均衡 -> JPress应用服务器 -> 业务处理 -> 数据返回
   ```
   - 支持HTTP/HTTPS
   - 请求限流控制
   - 会话状态维护

2. **静态资源处理**
   ```
   请求 -> CDN检查 -> 本地缓存检查 -> 源站获取 -> 更新缓存 -> 返回
   ```
   - 多级缓存策略
   - 智能缓存刷新
   - 资源压缩

3. **数据处理流程**
   ```
   数据写入请求 -> 消息队列 -> 异步处理 -> 持久化存储 -> 缓存更新
   ```
   - 异步处理
   - 最终一致性
   - 失败重试机制

4. **缓存更新机制**
   ```
   数据变更 -> 删除旧缓存 -> 写入数据库 -> 延迟双删
   ```
   - 缓存一致性保证
   - 缓存穿透防护
   - 缓存雪崩防护

### 部署方案示例

#### 1. 单机部署
```yaml
version: '3'
services:
  jpress:
    image: jpress/jpress:5.0
    ports:
      - "8080:8080"
    environment:
      - MYSQL_HOST=mysql
      - MYSQL_PORT=3306
      - MYSQL_DATABASE=jpress
      - MYSQL_USER=root
      - MYSQL_PASSWORD=123456
      - REDIS_HOST=redis
      - REDIS_PORT=6379
    volumes:
      - ./uploads:/opt/jpress/uploads
      - ./logs:/opt/jpress/logs
    depends_on:
      - mysql
      - redis

  mysql:
    image: mysql:5.7
    environment:
      - MYSQL_ROOT_PASSWORD=123456
      - MYSQL_DATABASE=jpress
    volumes:
      - ./mysql/data:/var/lib/mysql
      - ./mysql/conf:/etc/mysql/conf.d
    command: 
      --character-set-server=utf8mb4 
      --collation-server=utf8mb4_unicode_ci

  redis:
    image: redis:6.0
    volumes:
      - ./redis/data:/data
```

#### 2. 集群部署
```yaml
version: '3'
services:
  nginx:
    image: nginx:latest
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/conf:/etc/nginx/conf.d
      - ./nginx/ssl:/etc/nginx/ssl
      - ./nginx/logs:/var/log/nginx
    depends_on:
      - jpress1
      - jpress2

  jpress1:
    image: jpress/jpress:5.0
    environment:
      - MYSQL_HOST=mysql-master
      - MYSQL_PORT=3306
      - MYSQL_DATABASE=jpress
      - MYSQL_USER=root
      - MYSQL_PASSWORD=123456
      - REDIS_HOST=redis-master
      - REDIS_PORT=6379
      - JPRESS_NODE_ID=1
    volumes:
      - ./uploads:/opt/jpress/uploads
      - ./logs/jpress1:/opt/jpress/logs
    depends_on:
      - mysql-master
      - redis-master

  jpress2:
    image: jpress/jpress:5.0
    environment:
      - MYSQL_HOST=mysql-master
      - MYSQL_PORT=3306
      - MYSQL_DATABASE=jpress
      - MYSQL_USER=root
      - MYSQL_PASSWORD=123456
      - REDIS_HOST=redis-master
      - REDIS_PORT=6379
      - JPRESS_NODE_ID=2
    volumes:
      - ./uploads:/opt/jpress/uploads
      - ./logs/jpress2:/opt/jpress/logs
    depends_on:
      - mysql-master
      - redis-master

  mysql-master:
    image: mysql:5.7
    environment:
      - MYSQL_ROOT_PASSWORD=123456
      - MYSQL_DATABASE=jpress
    volumes:
      - ./mysql/master/data:/var/lib/mysql
      - ./mysql/master/conf:/etc/mysql/conf.d
    command: 
      --character-set-server=utf8mb4 
      --collation-server=utf8mb4_unicode_ci

  mysql-slave:
    image: mysql:5.7
    environment:
      - MYSQL_ROOT_PASSWORD=123456
    volumes:
      - ./mysql/slave/data:/var/lib/mysql
      - ./mysql/slave/conf:/etc/mysql/conf.d
    command: 
      --character-set-server=utf8mb4 
      --collation-server=utf8mb4_unicode_ci

  redis-master:
    image: redis:6.0
    volumes:
      - ./redis/master:/data

  redis-slave:
    image: redis:6.0
    volumes:
      - ./redis/slave:/data
```

#### 3. 高可用配置

##### Nginx配置示例
```nginx
# nginx.conf
upstream jpress {
    server jpress1:8080 weight=1 max_fails=3 fail_timeout=30s;
    server jpress2:8080 weight=1 max_fails=3 fail_timeout=30s;
    keepalive 32;
}

server {
    listen 80;
    server_name example.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name example.com;

    ssl_certificate     /etc/nginx/ssl/example.com.crt;
    ssl_certificate_key /etc/nginx/ssl/example.com.key;
    ssl_protocols       TLSv1.2 TLSv1.3;
    ssl_ciphers         HIGH:!aNULL:!MD5;

    # 静态资源缓存
    location /static {
        expires 7d;
        proxy_cache my_cache;
        proxy_cache_use_stale error timeout http_500 http_502 http_503 http_504;
        proxy_cache_valid 200 7d;
        proxy_pass http://jpress;
        add_header X-Cache-Status $upstream_cache_status;
    }

    # 上传目录
    location /uploads {
        alias /opt/jpress/uploads;
        expires 30d;
        access_log off;
    }

    # 主要请求处理
    location / {
        proxy_pass http://jpress;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
        
        # WebSocket支持
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```

##### MySQL主从配置
```ini
# master配置
[mysqld]
server-id = 1
log-bin = mysql-bin
binlog-format = ROW
sync-binlog = 1
innodb_flush_log_at_trx_commit = 1

# slave配置
[mysqld]
server-id = 2
relay-log = relay-bin
read_only = 1
```

##### Redis集群配置
```ini
# redis.conf
port 6379
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
appendonly yes
```

#### 4. 性能优化配置

```properties
# JVM优化
JAVA_OPTS="-Xms2g -Xmx2g -Xmn1g -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m"
JAVA_OPTS="$JAVA_OPTS -XX:+UseG1GC -XX:MaxGCPauseMillis=200"
JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/jpress/logs"
JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Xloggc:/opt/jpress/logs/gc.log"

# 数据库连接池
jboot.datasource.maximumPoolSize=50
jboot.datasource.minimumIdle=10
jboot.datasource.connectionTimeout=10000
jboot.datasource.idleTimeout=600000
jboot.datasource.maxLifetime=1800000

# Redis配置
jboot.redis.maxTotal=100
jboot.redis.maxIdle=10
jboot.redis.minIdle=5
jboot.redis.maxWaitMillis=5000
jboot.redis.testOnBorrow=true

# 缓存配置
jboot.cache.type=redis
jboot.cache.redis.timeout=2000
jboot.cache.redis.password=
jboot.cache.redis.database=0
```

### 开发环境
- JDK：1.8+（推荐使用 JDK 8u201+）
- Maven：3.6+（推荐使用 Maven 3.6.3+）
- MySQL：5.7+（推荐使用 MySQL 5.7.30+）
- IDE：IntelliJ IDEA 2020+（推荐）或 Eclipse 2020+
- 操作系统：支持 Windows、Linux、MacOS

### 核心框架
- **Jboot 4.1.9**：
  - 基于 JFinal 定制的全栈开发框架
  - 内置 AOP、RPC、MVC、缓存等功能
  - 支持微服务部署
  - 完善的性能监控
  
- **JFinal Weixin 3.4**：
  - 微信公众号开发框架
  - 支持微信支付、企业号、小程序等功能
  - 内置消息加解密
  
- **数据库框架**：
  - 主框架：JFinal ORM
  - 连接池：HikariCP
  - 分库分表：支持 Sharding-JDBC
  
- **缓存框架**：
  - 默认实现：EHCACHE
  - 分布式实现：Redis
  - 多级缓存支持
  
- **前端框架**：
  - 管理后台：LayUI 2.8.x
  - JS框架：jQuery 3.6.x
  - CSS框架：Bootstrap 4.x
  - 富文本编辑器：CKEditor、MarkdownEditor
  
- **模板引擎**：
  - Enjoy Template Engine
  - 支持模板热加载
  - 支持自定义标签和函数扩展

### 存储方案
- **数据库**：
  - 主数据库：MySQL 5.7+
  - 字符集：UTF-8mb4
  - 存储引擎：InnoDB
  - 支持主从分离
  
- **文件存储**：
  - 本地存储
  - 阿里云 OSS（支持图片处理）
  - 腾讯云 COS
  - 七牛云存储
  - 支持自定义存储策略
  
- **缓存系统**：
  - Redis 单机/集群
  - EHCACHE 本地缓存
  - 混合缓存策略

### 安全框架
- JWT Token 认证
- Shiro 权限框架
- XSS 防护
- CSRF 防护
- SQL 注入防护
- 密码加密：BCrypt

### 性能优化
- 动态 SQL 优化
- 多级缓存
- 静态资源 CDN
- Gzip 压缩
- 延迟加载
- 页面缓存
- 分布式会话

### 监控运维
- 内置监控功能：
  - JVM 监控
  - SQL 性能监控
  - API 调用监控
  - 缓存命中率监控
  
- 日志系统：
  - SLF4J + Logback
  - 分级日志
  - 自动归档
  - 支持日志服务器

- 运维功能：
  - 在线参数配置
  - 动态修改日志级别
  - 系统资源监控
  - 数据库连接池监控

### 扩展功能
- **搜索引擎**：
  - 默认：Database Search
  - 可选：Elasticsearch 7.x
  
- **任务调度**：
  - Cron 表达式支持
  - 分布式任务调度
  - 可视化任务管理
  
- **消息系统**：
  - 站内消息
  - 邮件系统（SMTP）
  - 短信系统（阿里云/腾讯云）
  - WebSocket 实时通讯

- **三方集成**：
  - 支付功能：微信支付、支付宝
  - 登录功能：微信、QQ、微博
  - 地图功能：百度地图、高德地图
  - 存储功能：OSS、COS、七牛云
  - 短信功能：阿里云、腾讯云

## 📦 模块说明

```
jpress-5.x/
├── jpress-core/           # 核心功能模块
├── jpress-commons/        # 公共组件
├── jpress-service/        # 服务层接口
├── jpress-service-provider/# 服务层实现
├── jpress-model/          # 数据模型层
├── jpress-web/            # Web层实现
├── jpress-template/       # 模板系统
├── jpress-addons/         # 插件系统
├── module-article/        # 文章模块
├── module-page/          # 页面模块
├── module-product/       # 产品模块
├── module-job/           # 任务模块
├── module-form/          # 表单模块
├── starter/              # 启动器
└── starter-tomcat/       # Tomcat启动器
```

## 🚀 快速开始

### 环境要求
1. JDK 1.8+
2. Maven 3.6+
3. MySQL 5.7+
4. Redis（可选）

### 安装步骤

1. **克隆项目**
```bash
git clone https://github.com/dennyops666/myjpress.git
cd jpress
```

2. **配置数据库**
- 创建数据库：`jpress`（UTF-8编码）
- 修改配置文件：`starter/src/main/resources/jboot.properties`

3. **编译运行**
```bash
mvn clean package
cd starter/target/
java -jar starter-5.0.jar
```

4. **访问系统**
- 前台地址：`http://localhost:8080`
- 后台地址：`http://localhost:8080/admin`
- 默认账号：`admin`
- 默认密码：`123456`

### Docker部署
```bash
# 构建镜像
./docker-build.sh

# 运行容器
docker-compose up -d
```

## 🔧 配置说明

### 数据库配置
```properties
jboot.datasource.type=mysql
jboot.datasource.url=jdbc:mysql://127.0.0.1:3306/jpress?characterEncoding=utf8&useSSL=false
jboot.datasource.user=your-username
jboot.datasource.password=your-password
```

### Redis配置（可选）
```properties
jboot.redis.host=127.0.0.1
jboot.redis.port=6379
jboot.redis.password=your-password
```

## 🔌 插件开发

1. **创建插件项目**
- 在 `jpress-addons` 目录下创建新的Maven模块
- 继承 `AddonBase` 类
- 实现必要的接口方法

2. **插件结构**
```
addon-hello/
├── src/
│   └── main/
│       ├── java/
│       └── resources/
│           └── addon.txt
└── pom.xml
```

3. **打包部署**
```bash
mvn clean package
```

## 📝 开发文档

详细的开发文档请参考：
- [用户手册](./doc/manual/user.md)
- [开发指南](./doc/development/)
- [API文档](./doc/api/)
- [部署文档](./doc/deploy/)

## 🤝 贡献指南

1. Fork 项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交改动 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 提交 Pull Request
