FROM node:alpine as build

WORKDIR /app
COPY package.json .
RUN npm install --only=prod
COPY . .
RUN npm run build

# TODO temp use vite
# CMD ["npm", "run", "serve-preview"]

FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY --from=build /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 90
CMD ["nginx", "-g", "daemon off;"]
