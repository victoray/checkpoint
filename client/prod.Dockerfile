FROM node:alpine
WORKDIR app
COPY package.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
COPY --from=0 /app/build /usr/share/nginx/html
