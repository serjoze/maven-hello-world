# ------------------------------------------------------------------------------
#               NOTE: THIS DOCKERFILE IS GENERATED VIA "build_latest.sh" or "update_multiarch.sh"
#
#                       PLEASE DO NOT EDIT IT DIRECTLY.
# ------------------------------------------------------------------------------
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM ubuntu:20.04

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata curl ca-certificates fontconfig locales vim \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_VERSION jdk11u

RUN set -eux; \
    ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in \
       aarch64|arm64) \
         ESUM='fe5f36959a11a574f688d2a27b7c13843bc6a483694ca6ebe054482a37713350'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk11u-2021-05-07-07-34/OpenJDK11U-jdk_aarch64_linux_hotspot_2021-05-07-07-34.tar.gz'; \
         ;; \
       armhf|armv7l) \
         ESUM='dc496edbccfb7dec6c9fc4a1855fe6768fbec29d6b95b93ee18f0e873421ea4d'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk11u-2021-05-07-07-34/OpenJDK11U-jdk_arm_linux_hotspot_2021-05-07-07-34.tar.gz'; \
         ;; \
       ppc64el|ppc64le) \
         ESUM='fbc40cc6412457b3bcfc309f157157c3bbaf5a87396df184fd599f9b103e7e13'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk11u-2021-05-07-07-34/OpenJDK11U-jdk_ppc64le_linux_hotspot_2021-05-07-07-34.tar.gz'; \
         ;; \
       s390x) \
         ESUM='8d429c00a4f877aef698d22b29fe3684fd37c620919c376b231be857d505c6a8'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk11u-2021-05-07-07-34/OpenJDK11U-jdk_s390x_linux_hotspot_2021-05-07-07-34.tar.gz'; \
         ;; \
       amd64|x86_64) \
         ESUM='2219cf4ec181453d7ce07b91b295f78c71933bc8b01c5ba9f2fbe74bc2b978f4'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk11u-2021-05-07-07-34/OpenJDK11U-jdk_x64_linux_hotspot_2021-05-07-07-34.tar.gz'; \
         ;; \
       *) \
         echo "Unsupported arch: ${ARCH}"; \
         exit 1; \
         ;; \
    esac; \
    curl -LfsSo /tmp/openjdk.tar.gz ${BINARY_URL}; \
    echo "${ESUM} */tmp/openjdk.tar.gz" | sha256sum -c -; \
    mkdir -p /opt/java/openjdk; \
    cd /opt/java/openjdk; \
    tar -xf /tmp/openjdk.tar.gz --strip-components=1; \
    rm -rf /tmp/openjdk.tar.gz;

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"

#CMD ["jshell"]
CMD ["/bin/sh"]