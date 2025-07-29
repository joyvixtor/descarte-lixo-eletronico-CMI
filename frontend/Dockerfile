# Dockerfile para o frontend React
FROM node:18-alpine

WORKDIR /app

# Copiar arquivos de dependências
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar código fonte
COPY . .

# Build da aplicação
RUN npm run build

# Usar nginx para servir os arquivos estáticos
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html

# Configurar nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
