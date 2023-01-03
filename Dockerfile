FROM ubuntu:20.04 as base

ENV QUARTO_VERSION "1.2.280"
ENV TZ=Europe/Paris

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt -y update
RUN apt -y install curl
RUN curl -sL "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb" -o quarto.deb
RUN apt -y install ./quarto.deb

ENTRYPOINT ["quarto"]

FROM base as full

RUN apt -y install r-base r-cran-tidyverse jupyter python-is-python3 python3-numpy python3-matplotlib python3-plotly python3-scipy python3-sklearn python3-skimage pandoc texlive-latex-recommended texlive-xetex texlive-luatex pandoc-citeproc texlive-latex-extra context wkhtmltopdf librsvg2-bin groff ghc nodejs php perl ruby r-base-core libjs-mathjax citation-style-language-styles
#libjs-katex
