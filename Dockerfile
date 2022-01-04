# FROM node:14-alpine AS build

# ENV NODE_ENV development

# #crea el directorio de trabajo dentro de la imagen
# WORKDIR /app

# #copia el directorio de trabajo actual al WORKDIR declarado en la imagen(paso anterior)
# COPY package.json .

# RUN npm install

# COPY . .

# RUN npm run build


# # CREATE NGINX SERVER
# FROM nginx:alpine AS prod-stage

# #copia lo que viene del stage pasado de la carpeta "build" a la ruta : /usr/share/nginx/html
# COPY --from=build /app/build /usr/share/nginx/html

# EXPOSE 80

# #corriendo comando de nginx
# CMD [ "nginx", "-g", "daemon off;" ]

# -------------------------------------------------------------------------------------------
FROM nginx:alpine

#COPY nginx /etc/nginx/
WORKDIR /etc/nginx/conf.d

COPY default.conf ./

COPY --chown=nginx:nginx /public /usr/share/nginx/html

RUN touch /var/run/nginx.pid && chown nginx:nginx /var/run/nginx.pid  && chown -R nginx:nginx /var/cache/nginx/

USER nginx

EXPOSE 8080
