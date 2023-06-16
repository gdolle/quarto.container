FROM ubuntu:22.04 as base

ENV QUARTO_VERSION=1.4.151
ENV TZ=Europe/Paris

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN cat "LANG=en_US.UTF-8" > /etc/default/locale
RUN apt -y update
RUN apt -y install curl \
                   libfontconfig
RUN curl -sL "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb" -o quarto.deb
RUN apt -y install ./quarto.deb

ENTRYPOINT ["quarto"]

FROM base as full

RUN apt -y install \
           r-base \
           r-cran-tidyverse \
           jupyter \
           python-is-python3 \
           python3-numpy\
           python3-matplotlib \
           python3-plotly \
           python3-scipy \
           python3-sklearn \
           python3-skimage \
           pandoc \
           texlive-full \
           pandoc-citeproc \
           texlive-latex-extra \
           context \
           wkhtmltopdf \
           librsvg2-bin \
           groff \
           ghc \
           nodejs \
           php \
           perl \
           ruby \
           r-base-core \
           libjs-mathjax \
           citation-style-language-styles \
           language-pack-en-base
           

RUN quarto check
#libjs-katex
