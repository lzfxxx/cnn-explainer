# Use Node.js LTS version
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json first for better Docker layer caching
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application and prepare dist directory
RUN npm run build && \
    mkdir -p ./dist && \
    cp -r ./public/assets ./dist && \
    cp -r ./public/bundle* ./dist && \
    cp -r ./public/global.css ./dist && \
    cp ./public/index.html ./dist

# Expose port 5000 (sirv default port)
EXPOSE 5000

# Start the application serving from dist directory
CMD ["npx", "sirv", "dist", "--host", "0.0.0.0", "--port", "5000"]