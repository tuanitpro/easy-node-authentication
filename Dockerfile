FROM node:carbon
# Create app directory
WORKDIR /app
# Install app dependencies
COPY package*.json ./
RUN npm install
# Copy app source code
COPY . .
#Expose port and start application
EXPOSE 8001
CMD [ "npm", "start" ]

FROM mongo
RUN mkdir -p /data/db /data/db \
	&& chown -R mongodb:mongodb /data/db /data/db
RUN  mkdir -p /data/logs /data/logs \
	&& chown -R mongodb:mongodb /data/logs /data/logs

VOLUME /data/db /data/db
EXPOSE 27017
CMD ["mongod"]