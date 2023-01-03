FROM ubuntu:20.04 as base

ENV QUARTO_VERSION "1.2.280"

RUN apt -y update
RUN apt -y install curl
RUN curl -sL "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb" -o quarto.deb
RUN apt -y install ./quarto.deb

ENTRYPOINT ["quarto"]

FROM base as full

RUN apt -y install R python-is-python3 pandoc texlive-latex-recommended texlive-xetex texlive-luatex pandoc-citeproc texlive-latex-extra context wkhtmltopdf librsvg2-bin groff ghc nodejs php perl python ruby r-base-core libjs-mathjax libjs-katex citation-style-language-styles
