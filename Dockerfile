# Choose your desired base image
FROM jupyter/scipy-notebook:latest

# Create a Python 2.x environment using conda including at least the ipython kernel
# and the kernda utility. Add any additional packages you want available for use
# in a Python 2 notebook to the first line here (e.g., pandas, matplotlib, etc.)
RUN conda create --quiet --yes -p $CONDA_DIR/envs/python2 python=2.7 ipython ipykernel kernda && \
    conda clean -tipsy

RUN pip install pandas==0.23.2 \
        sklearn \
        scipy==1.1.0 \
        numpy==1.14.5 \
        matplotlib==2.2.3 \
        datetime \
        statsmodels==0.9.0 \
        xlrd \
        openpyxl==2.4.8


RUN apt-get -y install cron nano

RUN conda install --yes -c conda-forge python-jsonrpc-server azure-storage-blob azure-storage-file
RUN conda install --yes -c conda-forge/label/gcc7 python-jsonrpc-server
RUN conda install --yes -c conda-forge/label/cf201901 python-jsonrpc-server

USER root

# Create a global kernelspec in the image and modify it so that it properly activates
# the python2 conda environment.
RUN $CONDA_DIR/envs/python2/bin/python -m ipykernel install && \
$CONDA_DIR/envs/python2/bin/kernda -o -y /usr/local/share/jupyter/kernels/python2/kernel.json

USER $NB_USER
