# Render Deployment Guide

## Prerequisites
- Render account with a Web Service project
- Remote MySQL database (Railway or similar)

## Environment Variables to Set on Render Dashboard

Set these in your Render Web Service settings:

```
DB_USERNAME=your_mysql_username
DB_PASSWORD=your_mysql_password
DB_HOST=your_mysql_host
DB_PORT=your_mysql_port
APP_JWT_SECRET=your_jwt_secret_key
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
MAIL_USERNAME=your_email@gmail.com
MAIL_PASSWORD=your_app_password
MAIL_FROM=your_email@gmail.com
```

## Deployment Steps

1. Connect your GitHub repository to Render
2. Select the BACKEND folder as the root directory
3. Use the "Procfile" start command or configure:
   - Build Command: `./mvnw clean package -DskipTests`
   - Start Command: `java -jar target/EVMBackend-0.0.1-SNAPSHOT.jar`
4. Add all environment variables above
5. Deploy!

## Notes
- The app runs on port 8080 (Render will expose it)
- Database must be accessible from Render's network
- Make sure your MySQL allows remote connections
