# Build stage
FROM node:18 as build

WORKDIR /app

# Copy application code.
COPY . .

# Install dependencies and build app.
RUN npm install && npm run build

# Production stage
FROM node:18 as production

WORKDIR /app

# Copy built app from the previous stage.
COPY --from=build /app .

CMD ["npm", "run", "start:prod"]
