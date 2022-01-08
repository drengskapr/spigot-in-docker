FROM openjdk:17-alpine AS build

WORKDIR /spigot/

ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar BuildTools.jar

RUN apk add --no-cache git && \
	java -Xmx1024M -jar BuildTools.jar --rev 1.18.1


FROM openjdk:17-jdk-slim-bullseye

WORKDIR /minecraft/

COPY --from=build /spigot/spigot-* .
COPY ./* ./

RUN mv spigot-* spigot.jar

EXPOSE 25565

ENTRYPOINT ["./start.sh"]
