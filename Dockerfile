FROM node:alpine

WORKDIR /app
COPY package.json .
RUN npm install --only=prod
COPY . .
RUN npm run build

# TODO temp use vite
CMD ["npm", "run", "serve-preview"]
