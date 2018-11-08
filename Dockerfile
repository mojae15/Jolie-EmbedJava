FROM jolielang/jolie

#Install git
RUN apk update
RUN apk add git

#Clone repo
RUN git clone https://github.com/mojae15/Jolie-EmbedJava

#Set directory to the pulled repo
WORKDIR /Jolie-EmbedJava

#Compile .java files to .jar files
CMD ["./compile.sh"]

#ENV stringToSplit "This is a test"

#RUN echo $stringToSplit

#Run Jolie program
CMD ["jolie", "main.ol"]