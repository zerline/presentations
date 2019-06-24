FROM sagemath/sagemath:8.6
USER root
RUN apt-get update && apt-get -qq install -y curl \
    &&  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
    && apt-get install -yq nodejs && npm install npm@latest -g
USER sage
RUN sage -pip install sage-combinat-widgets jupyter-francy francy-widget
RUN sage -sh -c "jupyter nbextension enable --py --sys-prefix jupyter_francy"
ENV HOME /home/sage
COPY --chown=sage:sage . ${HOME}/presentations
WORKDIR ${HOME}/presentations
