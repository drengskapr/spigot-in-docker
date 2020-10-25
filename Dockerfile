FROM openjdk:15-alpine AS build

WORKDIR /spigot/

ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar BuildTools.jar

RUN apk add --no-cache git && \
	java -Xmx1024M -jar BuildTools.jar --rev latest


FROM openjdk:8-jre-buster

WORKDIR /minecraft/

COPY --from=build /spigot/spigot-* .
COPY ./* ./

RUN mv spigot-* spigot.jar

EXPOSE 25565

CMD ["./start.sh"]
