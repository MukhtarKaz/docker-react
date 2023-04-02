FROM node:16-alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# /app/build <--  we will use the result build folder for next prod phase


FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

