FROM centos:7.3.1611 

LABEL maintainer="Karthik.Ramachandran2@anthem.com" 
#RUN yum -y update \

RUN ESUM="431f94a4f51c1f53d5a6e62fce3c65f16e955acd772554d17e0d864416d7ba05" \
	&& curl -L https://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/8.0.4.7/linux/x86_64/ibm-java-jre-8.0-4.7-x86_64-archive.bin -k -o /tmp/ibm-java.bin \
	&& echo "$ESUM  /tmp/ibm-java.bin" | sha256sum -c - \
	&& echo "INSTALLER_UI=silent" > /tmp/response.properties \
    && echo "USER_INSTALL_DIR=/opt/ibm/java" >> /tmp/response.properties \
    && echo "LICENSE_ACCEPTED=TRUE" >> /tmp/response.properties \
    && mkdir -p /opt/ibm \
    && chmod +x /tmp/ibm-java.bin \
    && /tmp/ibm-java.bin -i silent -f /tmp/response.properties \
    && rm -f /tmp/response.properties \
    && rm -f /tmp/ibm-java.bin \
    && yum clean all
  
  ENV JAVA_HOME=/opt/ibm/java/jre \
      PATH=/opt/ibm/java/jre/bin:$PATH
