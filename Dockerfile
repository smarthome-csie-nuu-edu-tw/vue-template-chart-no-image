#### 使用 Node 的版本(作為編譯)
FROM node:12.18.3-stretch AS builder 
# Node 環境設定為 production
ENV NODE_ENV development
RUN yarn global add @vue/cli
RUN vue --version
# Node 在容器內的位置
WORKDIR /home/node
# 編譯與安裝環境
COPY app /app
RUN cd app && \
    npm install -D vuepress && \
    npm run build

### 正式伺服器
#FROM httpd:2.4
#COPY --from=builder /home/node/devops-ui/dist/ /usr/local/apache2/htdocs/

#FROM nginx
#COPY ./app/dist /usr/share/nginx/html
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]