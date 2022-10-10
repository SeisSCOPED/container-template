FROM ghcr.io/seisscoped/container-base

LABEL maintainer="Ian Wang"

RUN conda config --prepend channels conda-forge \
    && conda install obspy \
    && conda install -c conda-forge pygmt \
    && conda install xarray \
    && conda install cartopy \
    && conda install mpi4py mpich=4.0.*=external_* \
    && conda clean -afy \
    && docker-clean

RUN cd /home/scoped \
    && git clone --depth=1 https://github.com/uafgeotools/mtuq.git \
    && cd mtuq \
    && pip install -e . \
    && bash ./data/examples/unpack.bash\
    && docker-clean

