FROM node:20.7.0-alpine3.18
RUN addgroup profile && adduser -S -G profile seroven
USER seroven
WORKDIR /app/
COPY --chown=seroven "package*.json" .
RUN npm install
COPY --chown=seroven . .
ENV API=https://mywebapi.com/api
EXPOSE 5173
CMD ["npm", "run", "dev"]