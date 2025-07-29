# Guia de Deploy em VM

## Pré-requisitos na VM

- Ubuntu 20.04+ ou CentOS 7+
- Java 17
- Node.js 18+
- Nginx
- SQLite3

## Passos para Deploy

### 1. Preparação da VM

```bash
# Atualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar Java 17
sudo apt install openjdk-17-jdk -y

# Instalar Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Instalar Nginx
sudo apt install nginx -y

# Instalar SQLite
sudo apt install sqlite3 -y
```

### 2. Deploy do Backend

```bash
# Fazer build da aplicação
cd backend
mvn clean package

# Copiar JAR para VM
scp target/descarte-eletronico-*.jar user@vm-ip:/opt/descarte-backend/

# Criar serviço systemd
sudo tee /etc/systemd/system/descarte-backend.service > /dev/null <<EOF
[Unit]
Description=Descarte Eletronico Backend
After=network.target

[Service]
Type=simple
User=ubuntu
ExecStart=/usr/bin/java -jar /opt/descarte-backend/descarte-eletronico-*.jar
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Iniciar serviço
sudo systemctl enable descarte-backend
sudo systemctl start descarte-backend
```

### 3. Deploy do Frontend

```bash
# Build da aplicação React
cd frontend
npm run build

# Copiar build para VM
scp -r build/* user@vm-ip:/var/www/html/descarte-frontend/
```

### 4. Configuração do Nginx

```nginx
server {
    listen 80;
    server_name seu-dominio.com;

    # Frontend
    location / {
        root /var/www/html/descarte-frontend;
        try_files $uri $uri/ /index.html;
    }

    # API Backend
    location /api/ {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### 5. SSL (Opcional)

```bash
# Instalar Certbot
sudo apt install certbot python3-certbot-nginx -y

# Obter certificado SSL
sudo certbot --nginx -d seu-dominio.com
```

## Monitoramento

```bash
# Verificar status do backend
sudo systemctl status descarte-backend

# Ver logs
sudo journalctl -u descarte-backend -f

# Verificar Nginx
sudo systemctl status nginx
```
