# Stage 1: Build the Angular app
FROM node:14-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 4200
# CMD ["npm", "run", "start"]

# Stage 2: Use nginx to serve the built Angular app
FROM nginx:alpine
COPY --from=build /app/dist/crud-app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]